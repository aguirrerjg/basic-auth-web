create table public.profiles(
  id uuid unique references auth.users on delete cascade,
  first_name varchar(100),
  last_name varchar(100),
  phone_number varchar(100),
  country_code varchar(10),
  avatar_url text,
  email text,
  phone_validate boolean default false,
  updated_at timestamp with time zone default now() not null,
  created_at timestamp with time zone default now() not null,
  primary key (id)
);

alter table public.profiles enable row level security;

create policy "Users can view own profile" on profiles
  for select to authenticated
    using (auth.uid() = id);

create policy "Users can update own profile" on profiles
  for update to authenticated
    using (auth.uid() = id);

create or replace function public.handle_new_user()
  returns trigger
  as $$
begin
  insert into public.profiles(id, email)
    values(new.id, new.raw_user_meta_data->>'email');
  return new;
end;
$$
language plpgsql
security definer;

create trigger on_auth_user_created
  after insert on auth.users for each row
  execute procedure public.handle_new_user();

-- Set up Storage!
insert into storage.buckets (id, name)
values ('avatars', 'avatars');

-- security for storage bucket
create policy "Public Write Access" on storage.objects for
insert
    with check (bucket_id = 'avatars');

create policy "Individual user Access" on storage.objects for
select
    using (auth.uid() = owner);