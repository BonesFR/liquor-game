extends Control
signal QueryDone
var it = 0
var value = 20


# Called when the node enters the scene tree for the first time.
func _ready():
	$HTTPRequest.request("https://www.thecocktaildb.com/api/json/v1/1/random.php")

func _on_http_request_request_completed(result, response_code, headers, body):
	var json = JSON.new()
	var data = json.parse_string(body.get_string_from_utf8())
	Global.Data = data
	Global.DrinkList[(data.drinks[0]["strDrink"])] = value
	it = it + 1
	value = value + 10
	if (it < 5):
		$HTTPRequest.request("https://www.thecocktaildb.com/api/json/v1/1/random.php")
	if (it >= 5):
		emit_signal("QueryDone")
