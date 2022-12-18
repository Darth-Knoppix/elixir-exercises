<script>
  const coffeeListLoader = fetch('http://localhost:4000/api/').then(r => r.json());
</script>

<h1>Coffee List</h1>

{#await coffeeListLoader}
  <progress value="50"></progress>
{:then coffeeList}
  <ul>
    {#each Object.entries(coffeeList) as [name, price]}
      <li><b>{name}</b> {price}</li>
    {/each}
  </ul>

{:catch error}
  <p>Something went wrong, couldn't get the list of coffees available</p>
  <output>{error.message}</output>
{/await}


