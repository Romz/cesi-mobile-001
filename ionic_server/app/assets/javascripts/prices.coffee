# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready () ->
  $("#upload").click () ->
    param =
      name: "test produit"
      description: "test description"
      barcode: "test barcode"

    input = document.getElementById('photo');
    if input.files.length > 0
      reader = new FileReader()
      file = input.files[0]
      reader.onloadend = (e) ->
        param.photo = e.target.result
        $.post("/products.json", {product: param}).success (e) ->
          console.log e
      reader.readAsDataURL(file)
