<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Title</title>
    <link rel="stylesheet" href="/demo/assets?type=css&name=bootstrap5.3.min.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=fontawesome.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=brands.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=solid.css">
    <link rel="stylesheet" href="/demo/assets?type=css&name=my_style.css">
</head>
<body>
    <form action="/demo/books/update" method="post" class="w-100">

        <div class="bg-light d-flex justify-content-between mb-4 ps-4 pe-4 pt-2 pb-2 border-bottom">
            <h5 class="card-title">Form Title</h5>
            <div class="button-group">
                <button class="btn btn-sm btn-outline-primary">Update</button>
                <button class="btn btn-sm btn-outline-danger">Delete</button>
                <button class="btn btn-sm btn-outline-success">Save</button>
            </div>
        </div>
        <div class="d-flex w-100 justify-content-center mb-5">
            <img src="/demo/image_assets?type=png&name=book_placeholder.png" alt="image" class="card_cover" style="margin: 0 auto;" />
        </div>
    
        <div class="container">
            <label for="book_quantity" class="mb-1">How many copies do you want?</label>
            <div class="input-group mb-3">
                <input id="book_quantity" name="quantity" type="number" min="0" placeholder="No copies are available" class="form-control" <%-- if(readonly) { out.println("dispabled"); } --%>  />
            </div>

            <div class="button-group">
                <button class="btn btn-sm btn-outline-primary">Update</button>
                <button class="btn btn-sm btn-outline-danger">Delete</button>
                <button class="btn btn-sm btn-outline-success">Save</button>
            </div>
        </div>
    </form>

</body>
</html>