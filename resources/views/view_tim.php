<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>View Team</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        a {
            color: #333;
            text-decoration: none;
            padding: 5px 10px;
            margin: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        a:hover {
            background-color: #ddd;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Table Styles */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        td:first-child,
        th:first-child {
            width: 5%;
        }

        .center {
            text-align: center;
        }

    </style>
</head>
<body>
<h2 align="center">Data Team F1 2023</h2>

<!-- Table to Display Data -->
<table border="1" width="80%" align="center">
    <thead>
        <tr>
            <th width="10%">Posisi</th>
            <th width="30%">Nama Team</th>
            <th width="40%">Desc Team</th>
            <th width="20%">Points Team</th>
        </tr>
    </thead>
    <tbody id="dataTable">
        <!-- Data will be populated here -->
    </tbody>
</table>

<script>
// Function to fetch data from the API
async function fetchData() {
    try {
        // Fetch data from the API without any search term
        const response = await fetch('http://127.0.0.1:8000/api/f1');
        
        // Check if the response is ok (status code 200)
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        // Parse the response to JSON
        const result = await response.json();
        
        // Log the result to check what data is returned
        console.log(result);

        const tableBody = document.getElementById('dataTable');
        tableBody.innerHTML = ''; // Clear previous data

        // Ensure that the 'status' is true and 'data.data' contains data
        if (result.status && result.data && Array.isArray(result.data) && result.data.length > 0) {
            result.data.forEach(f1 => {
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td align="center">${f1.posisi}</td>
                    <td align="center">${f1.tim}</td>
                    <td>${f1.desctim}</td>
                    <td>${f1.point}</td>
                `;
                tableBody.appendChild(tr);
            });
        } else {
            tableBody.innerHTML = '<tr><td colspan="4" align="center">No data found</td></tr>';
        }
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}

// Initial data load
fetchData();
</script>
</body>
</html>
