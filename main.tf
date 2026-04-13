# creating a file using terrafrom 


# block parameter {

# 	arguments

# }


resource local_file "my_file"{

	filename = "automate_text.txt"
	content = "hellow sandip welcome to terra world"
	file_permission = "0755"

}


