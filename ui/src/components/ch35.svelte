<script>
    let random = $state(null);
  
    const fetchRandom = async () => {
      const response = await fetch("http//localhost:8080/api/random");
      console.log(response)
      const data = await response.json();
      random = data.random;
    }
  </script>
  
  <button on:click={fetchRandom}>New random</button>
  <p>Random: {random}</p>
