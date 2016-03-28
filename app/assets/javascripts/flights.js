$(document).on("ready", ready);

function ready() {
  $('#new_flight').on('ajax:success', newFlight);

  function newFlight(event, data) {
    $('body').append(data);
  }
}
