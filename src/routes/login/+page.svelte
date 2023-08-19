<script lang="ts">
    import { superForm } from "sveltekit-superforms/client";
    import type { PageData } from './$types';
    export let data: PageData;
    const { form, errors, enhance } = superForm(data.form);
</script>


<div class="min-h-screen bg-gray-100 flex flex-col justify-center py-12 px-6 lg:px-8">
    <div class="sm:mx-auto sm:w-full sm:max-w-md">
      <img class="mx-auto h-12 w-auto" src="https://tailwindui.com/img/logos/workflow-mark-indigo-600.svg" alt="Workflow" />
      <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">Login your account</h2>
    </div>
  
    <div class="mt-8 sm:mx-auto sm:w-full sm:max-w-md">  
        <form class="mb-0 space-y-6" action="#" method="POST" use:enhance>  
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
            <button type="submit" class="w-full flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">Login</button>
          </div>
          <div class="flex items-center">
            Don't have an account? <a href="/register" class="text-indigo-600 hover:text-indigo-500"
              >Sign up</a>
          </div>
        </form>
    </div>
</div>