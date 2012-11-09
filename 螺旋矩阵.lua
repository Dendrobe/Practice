--声明变量
__theArray = {}
--初始化矩阵
function create_Array(__number)
	for i = 1, __number do
		__theArray[i] = {}
		for j = 1,__number do
		__theArray[i][j] = 0
		end
	end
end
--打印矩阵
function print_Array(__number)
	local __string = ""
	local k = 1
	for i = 1, __number do
		for j = 1, __number do
			if k ~= __number then
				__string = __string..tostring(__theArray[i][j]).."\t"
				k = k + 1
			else
				print(__string..tostring(__theArray[i][j]))
				k = 1
				__string = ""
			end
		end
	end
end
--内螺旋赋值
function inward_Spiral(__number)
	local __i_min = 1
	local __i_max = __number
	local __j_min = 1
	local __j_max = __number
	local k = 1
	local __value = 1
	local ical, jcal = 1, 1

	while __value ~= __number^2+1 do
		if k == 1 then
			for jcal = __j_min, __j_max do
				__theArray[ical][jcal] = __value
				__value = __value + 1
			end
			jcal = __j_max
			__i_min = __i_min + 1
			k = 2
		elseif k == 2 then
			for ical = __i_min, __i_max do
				__theArray[ical][jcal] = __value
				__value = __value + 1
			end
			ical = __i_max
			__j_max = __j_max - 1
			k = 3
		elseif k == 3 then
			for jcal = __j_max, __j_min, -1 do
				__theArray[ical][jcal] = __value
				__value = __value + 1
			end
			jcal = __j_min
			__i_max = __i_max - 1
			k = 4
		elseif k == 4 then
			for ical = __i_max, __i_min, -1 do
				__theArray[ical][jcal] = __value
				__value = __value + 1
			end
			ical = __i_min
			__j_min = __j_min + 1
			k = 1
		end
	end

	print_Array(__number)
end
--交互主体
function main()
	local __number = nil
	repeat
		print("Please enter a number:")
		__number = tonumber(io.read())
	until __number
	create_Array(__number)
	inward_Spiral(__number)
	--print_Array(__number)
end
--开始执行
main()
