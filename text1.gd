extends TextureButton

func _http_request_completed(result, response_code, headers, body):
	var image = Image.new()
	print(body)
	var image_error = image.load_png_from_buffer(body)
	if image_error != OK:
		print("An error occurred while trying to display the image.")
	var texture = ImageTexture.create_from_image(image)
	self.texture_normal = texture

func _on_interact_ray_open_computer():
	var http_request = HTTPRequest.new()
	add_child(http_request)
	http_request.connect("request_completed", _http_request_completed)
	
	var http_error = http_request.request("https://via.placeholder.com/512")
