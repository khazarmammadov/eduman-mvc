//
//
// $(document).ready(function () {
//     $('#example').DataTable({
//         "ajax": {
//             "url": "/api/tPerson",
//             "dataType": "json",
//             "type": "GET",
//             "dataSrc": "data"
//         },
//         "columns": [
//             {"data": 'id'},
//             {"data": 'name'},
//             {"data": 'surname'},
//             {"data": 'middleName'}
//         ],
//         "processing": true,
//         "serverSide": true
//     });
// });

$(document).ready(function () {

    toastr.options = {
        "closeButton": true,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    var table = $('#example').DataTable({
        "ajax": {
            "url": "/api/tPerson",
            "dataType": "json",
            "type": "GET",
            "dataSrc": "data"
        },
        "columns": [
            {"data": 'id'},
            {"data": 'name'},
            {"data": 'surname'},
            {"data": 'middleName'},
            {
                "data": "Action",
                "className": "center",
                "defaultContent": '<button class="editBtn">Edit</button>'
            }
        ],
        "processing": true,
        "serverSide": true
    });

   // var modal = document.getElementById("myModal");

    var span = document.getElementsByClassName("close")[0];

    span.onclick = function () {
        $('#myModal').style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == $('#myModal')) {
            $('#myModal').style.display = "none";
        }
    }

    $('#example tbody').on('click', 'button.editBtn', function () {
        var data = table.row($(this).parents('tr')).data();
        $('#studentId').val(data.id);
        $('#firstName').val(data.name);
        $('#middleName').val(data.middleName);
        $('#surname').val(data.surname);
        $('#myModal').show();
    });

    document.getElementById("editForm").onsubmit = function (event) {
        event.preventDefault();
        // Get form values
        var studentId = document.getElementById("studentId").value;
        var firstName = document.getElementById("firstName").value;
        var middleName = document.getElementById("middleName").value;
        var surname = document.getElementById("surname").value;

      //  console.log(`ID: ${studentId}, First Name: ${firstName}, Middle Name: ${middleName}, Surname: ${surname}`);

        var person = {
            id: studentId,
            name: firstName,
            surname: surname,
            middleName: middleName
        };

        $.ajax({
            url: 'http://localhost:8080/api/update',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(person),
            success: function (result) {
                toastr.success('Person created: ' + studentId, 'Successful add operation');
                table.ajax.reload();
                $('#editForm')[0].reset();
                $('#myModal').hide();
                // $('#myModal').style.display = "none";
            },
            error: function (xhr, status, error) {
                toastr.error('exception', 'Unsuccessful add operation');
            }
        });

    }
});
