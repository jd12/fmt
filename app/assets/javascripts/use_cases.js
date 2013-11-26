function addField(listName) {
  $(function() {
    $("a#add_"+listName).click(function(e) {
      e.preventDefault();

      var new_item = $("#"+listName+"_list li:last").clone().find("textarea").val('').end();
      var increment = (parseInt(new_item.find("label").attr("for").match(/\d/)[0])+1);

      var for_attribute = new_item.find("label").attr("for");
      var id_attribute = new_item.find("textarea").attr("id");
      var name_attribute = new_item.find("textarea").attr("name");

      new_item.find("label").attr("for", for_attribute.replace(/\d/, increment));
      new_item.find("textarea").attr("id", id_attribute.replace(/\d/, increment));
      new_item.find("textarea").attr("name", name_attribute.replace(/\d/, increment));

      new_item.appendTo("#"+listName+"_list");
    });
  });
}