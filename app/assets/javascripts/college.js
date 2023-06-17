function createCollege() {
  event.preventDefault(); 
  // Get the form data
  var formData = $('#newCollegeFormData').serialize();

  // Make an AJAX POST request to create a new college
  $.ajax({
    url: '/colleges',
    type: 'POST',
    data: formData,
    dataType: 'script',
    success: function(response) {
      // Handle the response and update the college list
      $('#dynamic-content').html(response);
      $('#newCollege').modal('hide');
    },
    error: function(xhr, status, error) {
      // Handle the error if needed
      console.error(error);
    }
  });
}


function editCollege(id) {
  // Make an AJAX GET request to fetch the college data for editing
  $.ajax({
    url: '/colleges/' + id + '/edit',
    type: 'GET',
    dataType: 'script',
    success: function(response) {
      // Handle the response and update the modal with the edit form
      $('#newCollegeForm').html(response);
      $('#newCollege').modal('show');
    },
    error: function(xhr, status, error) {
      // Handle the error if needed
      console.error(error);
    }
  });
}

function deleteCollege(id) {
  // Make an AJAX DELETE request to delete the college
  $.ajax({
    url: '/colleges/' + id,
    type: 'DELETE',
    dataType: 'script',
    success: function(response) {
      // Handle the response and update the college list
      $('#dynamic-content').html(response);
    },
    error: function(xhr, status, error) {
      // Handle the error if needed
      console.error(error);
    }
  });
}
