<h2>Upload Profile Picture</h2>

<form action="uploadFile" method="POST" enctype="multipart/form-data">
    <!-- Hidden field to pass the ID -->
    <input type="hidden" name="id">
    <label for="file">Choose a profile picture:</label>
    <input type="file" id="file" name="file" /><br><br>

    <button type="submit">Upload File</button>
</form>
