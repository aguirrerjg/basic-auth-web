<script lang="ts">
    import type { PageData } from './$types';
		import { superForm } from "sveltekit-superforms/client";
    export let data: PageData;
		const { form, errors, enhance } = superForm(data.form, {
    resetForm: true,
  });
</script>
<div class="min-h-screen bg-gray-100 flex flex-col justify-center py-12 px-6 lg:px-8">
  <div class="sm:mx-auto sm:w-full sm:max-w-md">
    <img class="mx-auto h-12 w-auto" src="https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg" alt="Workflow" />
    <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">Create your account</h2>
    <p class="mt-2 text-center text-sm text-gray-600 max-w">
      Already registered?
      <a href="#" class="font-medium text-indigo-600 hover:text-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-500">Sign in</a>
    </p>
  </div>

  <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">
    <div class="bg-white py-8 px-6 shadow rounded-lg sm:px-10">
      <form class="mb-0 space-y-6" action="#" method="POST" >
				<div>
          <label for="full_name" class="block text-sm font-medium text-gray-700">Name</label>
          <div class="mt-1">
            <input type="text" name="full_name" bind:value={$form.full_name} />
          {#if $errors.full_name}
            <span class="block text-red-600 dark:text-red-500">{$errors.full_name}</span>
          {/if}
          </div>
        </div>

        <div>
          <label for="email" class="block text-sm font-medium text-gray-700">Email address</label>
          <div class="mt-1">
            <input type="email" name="email" bind:value={$form.email} />
          {#if $errors.email}
            <span class="block text-red-600 dark:text-red-500">{$errors.email}</span>
          {/if}
          </div>
        </div>

        <div>
          <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
          <div class="mt-1">
            <input type="password" name="password" bind:value={$form.password} />
          {#if $errors.password}
            <span class="block text-red-600 dark:text-red-500">{$errors.password}</span>
          {/if}
          </div>
        </div>

				<div>
          <label for="passwordConfirm" class="block text-sm font-medium text-gray-700">Confirm Password</label>
          <div class="mt-1">
            <input type="password" name="passwordConfirm" bind:value={$form.passwordConfirm} />
          {#if $errors.passwordConfirm}
            <span class="block text-red-600 dark:text-red-500">{$errors.passwordConfirm}</span>
          {/if}
          </div>
        </div>

        <div class="flex items-center">
          <input id="terms-and-privacy" name="terms-and-privacy" type="checkbox" class="" />
          <label for="terms-and-privacy" class="ml-2 block text-sm text-gray-900"
            >I agree to the
            <a href="#" class="text-indigo-600 hover:text-indigo-500">Terms</a>
            and
            <a href="#" class="text-indigo-600 hover:text-indigo-500">Privacy Policy</a>.
          </label>
        </div>

        <div>
          <button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Sign up</button>
        </div>
      </form>
    </div>
  </div>
</div>