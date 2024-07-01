<!DOCTYPE html>
<html lang="en">
<head>
  <title>Stores</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
  <h2>Stores</h2>
      
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>Name</th>
        <th>Address</th>
        <th>Latitude</th>
        <th>Longitude</th>
      </tr>
    </thead>
    <tbody>
        @if(count($data))
        @foreach($data as $val)
        <tr>
            <td>{{ $val->title }}</td>
            <td>{{ $val->address }}</td>
            <td>{{ $val->latitude }}</td>
            <td>{{ $val->longitude }}</td>
        </tr>
      @endforeach
      @endif
    </tbody>
  </table>
</div>
</body>
</html>
