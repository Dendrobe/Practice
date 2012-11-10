--声明变量
theArray = {}
--初始化矩阵
function create_Array(number)
	for i = 1, number do
		theArray[i] = {}
		for j = 1,number do
		theArray[i][j] = 0
		end
	end
end
--打印矩阵
function print_Array(number)
	local arrayPrint = ""
	local k = 1
	for i = 1, number do
		for j = 1, number do
			if k ~= number then
				arrayPrint = arrayPrint..tostring(theArray[i][j]).."\t"
				k = k + 1
			else
				print(arrayPrint..tostring(theArray[i][j]))
				k = 1
				arrayPrint = ""
			end
		end
	end
end
--内螺旋赋值
function inward_Spiral(number)
	local i_min = 1
	local i_max = number
	local j_min = 1
	local j_max = number
	local k = 1
	local count = 1
	local ical, jcal = 1, 1

	while count ~= number^2+1 do
		if k == 1 then
			for jcal = j_min, j_max do
				theArray[ical][jcal] = count
				count = count + 1
			end
			jcal = j_max
			i_min = i_min + 1
			k = 2
		elseif k == 2 then
			for ical = i_min, i_max do
				theArray[ical][jcal] = count
				count = count + 1
			end
			ical = i_max
			j_max = j_max - 1
			k = 3
		elseif k == 3 then
			for jcal = j_max, j_min, -1 do
				theArray[ical][jcal] = count
				count = count + 1
			end
			jcal = j_min
			i_max = i_max - 1
			k = 4
		elseif k == 4 then
			for ical = i_max, i_min, -1 do
				theArray[ical][jcal] = count
				count = count + 1
			end
			ical = i_min
			j_min = j_min + 1
			k = 1
		end
	end

	print_Array(number)
end
--交互主体
function main()
	local number = nil
	repeat
		print("Please enter a number:")
		number = tonumber(io.read())
	until number
	create_Array(number)
	inward_Spiral(number)
	--print_Array(number)
end
--开始执行
main()
