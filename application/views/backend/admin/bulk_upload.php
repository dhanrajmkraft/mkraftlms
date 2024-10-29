<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bulk User Upload</title>
    <link rel="stylesheet" href="path_to_your_css_framework.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="row ">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <h4 class="page-title"> <i class="mdi mdi-apple-keyboard-command title_icon"></i> Bulk User Upload </h4>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-body">
                <h4 class="header-title mb-3">Upload User Excel Form</h4>

                <form id="excel-upload-form" action="<?= base_url('user_import/preview_excel') ?>" enctype="multipart/form-data" method="post">
                    <div class="form-group">
                        <label for="userfile">Upload Excel File<span class="required">*</span></label>
                        <input type="file" class="form-control" id="userfile" name="userfile" accept=".xls,.xlsx" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Upload</button>
                </form>

                <!-- Preview Table -->
                <div id="preview-table" style="display:none; margin-top: 30px;">
                    <h4 class="header-title mb-3">Preview Excel Data</h4>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Phone</th>
                                <th>Address</th>
                                <th>Course ID</th>
                                <th>Biography</th>
                                <th>Facebook</th>
                                <th>Twitter</th>
                                <th>LinkedIn</th>
                            </tr>
                        </thead>
                        <tbody id="excel-data-body">
                            <!-- Data will be dynamically inserted here -->
                        </tbody>
                    </table>
                    
                    <form id="confirm-upload-form" action="<?= base_url('user_import/bulk_register') ?>" method="post">
                        <input type="hidden" name="sheetData" id="sheetData">
                        <button type="submit" class="btn btn-success">Confirm and Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Handle form submission for Excel upload
    $('#excel-upload-form').on('submit', function (event) {
        event.preventDefault();
        var formData = new FormData(this);

        $.ajax({
            url: '<?= base_url('user_import/preview_excel') ?>',
            type: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                var data = JSON.parse(response);
                if (data.error) {
                    alert(data.error);
                    return;
                }

                var tableBody = $('#excel-data-body');
                tableBody.empty();

                // Populate table with Excel data
                data.forEach(function (row, index) {
                    if (index === 0) return; // Skip header row
                    var html = '<tr>';
                    row.forEach(function (cell) {
                        html += '<td>' + cell + '</td>';
                    });
                    html += '</tr>';
                    tableBody.append(html);
                });

                // Show preview table and set hidden input
                $('#preview-table').show();
                $('#sheetData').val(JSON.stringify(data));
            },
            error: function () {
                alert('Error occurred while uploading the file.');
            }
        });
    });
</script>

</body>
</html>
