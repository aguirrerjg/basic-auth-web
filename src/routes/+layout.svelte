<script lang='ts'>
	// The ordering of these imports is critical to your app working properly
	import '@skeletonlabs/skeleton/themes/theme-crimson.css';
	// If you have source.organizeImports set to true in VSCode, then it will auto change this ordering
	import '@skeletonlabs/skeleton/styles/skeleton.css';
	// Most of your app wide CSS should be put in this file
	import '../app.postcss';
	import { AppShell, AppBar, ListBox, ListBoxItem } from '@skeletonlabs/skeleton';
	import type { LayoutData } from './$types';
  import { onMount } from "svelte"
  import { invalidate } from "$app/navigation"
  import { popup } from '@skeletonlabs/skeleton';
  import type { PopupSettings } from '@skeletonlabs/skeleton';

let comboboxValue: string;

const popupCombobox: PopupSettings = {
	event: 'focus-click',
	target: 'popupCombobox',
	placement: 'bottom',
	closeQuery: '.listbox-item'
};
				
	export let data: LayoutData
  $: ({ session, supabase } = data)
  onMount(() => {
    const {
        data: { subscription },
    } = supabase.auth.onAuthStateChange((event, _session) => {
        if (_session?.expires_at !== session?.expires_at) {
            invalidate("supabase:auth")
        }
    })
    return () => subscription.unsubscribe()
  })
</script>

<!-- App Shell -->
<AppShell>
	<svelte:fragment slot="header">
		<!-- App Bar -->
		<AppBar>
			<svelte:fragment slot="lead">
				<strong class="text-xl uppercase">Skeleton</strong>
			</svelte:fragment>
			<svelte:fragment slot="trail">
		
				<div class="flex md:order-2">
					{#if session}
						<div class="flex items-center gap-2">
							<a class="btn btn-sm" href="/account">Account</a>
							<form action="/logout" method="POST">
								<button type="submit">Logout</button>
							</form>
						</div>
					{:else}
						<div class="flex items-center gap-2">
							<a class="btn btn-sm" href="/register">Register</a>
							<a class="btn btn-sm" href="/login">Login</a>
						</div>
					{/if}
				</div>	
			</svelte:fragment>
		</AppBar>
	</svelte:fragment>
	<!-- Page Route Content -->
	<slot />
</AppShell>
