<template>
  <div>
    <table>
      <thead>
      <tr>
        <th>Name</th>
        <th>Description</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="(item, index) in items" :key="index">
        <td>
          <router-link :to="`/details/${item.name}`">{{ item.name }}</router-link>
        </td>
        <td>{{ item.description }}</td>
      </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        { id: 1, name: 'Item 1', description: 'Description for Item 1' },
        { id: 2, name: 'Item 2', description: 'Description for Item 2' },
        { id: 3, name: 'Item 3', description: 'Description for Item 3' },
        // Add more items as needed
      ],
    };
  },
};
</script>

<style scoped>
/* Add your custom CSS styles for the table here */
table {
  width: 100%;
  border-collapse: collapse;
}

th, td {
  border: 1px solid #ccc;
  padding: 10px;
  text-align: center;
}

router-link {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%; /* Ensure the link fills the entire cell */
  cursor: pointer;
  text-decoration: none;
  color: inherit;
}

tr:hover {
  background-color: lightblue;
}
</style>
