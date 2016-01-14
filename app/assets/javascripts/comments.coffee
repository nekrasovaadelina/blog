class Comment
  constructor: ->
    @bindEvents()

  bindEvents: =>
    $(document).on "ajax:success", "[data-behavior='comment_destroy']",
    @destroyComment
    $(document).on "ajax:success", "[data-behavior='comment-form']",
    @addComment

  destroyComment: (event) =>
    comment_id = $(event.currentTarget).data("id")
    $(".comment-wrapper[data-id='#{comment_id}']").remove()

  addComment: (event, data, status, xhr) =>
    $(".comments").append xhr.responseText
    $(".comment-form").find("#comment_text").val('')

$ ->
Comment = new Comment
