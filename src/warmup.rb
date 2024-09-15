def fib(n)
    if n < 0
      raise Exception, "Input a whole number for fib"
    elsif n == 0
      return []
    elsif n == 1
      return [0]
    else
      fib_nums = [0, 1]
      for i in 2..n - 1
        puts i
        fib_nums.push(fib_nums[i - 1] + fib_nums[i - 2])
      end
      return fib_nums
    end
end

def isPalindrome(n)
    if !(n.is_a?(Integer))
        raise Exception, "Input an integer for isPalindrome"
    else
        n = n.abs
        r = n.to_s.reverse.to_i
        if n == r
            return true
        else
            return false
        end
    end
end

def nthmax(n, a)
    if !(n.is_a?(Integer))
        raise Exception, "n needs to be an integer"
    elseif n < 0
        raise Exception, "n needs to be a positive integer"
    elsif !(a.is_a?(Array))
        raise Exception, "a needs to be an array"
    elsif n >= a.length
        return nil
    else
        sorted = a.sort.reverse 
        return sorted[n] 
    end
end

def freq(s)
    if !(s.is_a?(String))
        raise Exception, "Input a string for freq"
    else
        counts = {}
        s.each_char do |i|
            if counts.has_key?(i)
                counts[i] += 1
            else
                counts[i] = 1
            end
        end
    end
    
    # for empty string 
    return "" if counts.empty?

    max_pair = counts.max_by { |key, value| value }
    return max_pair[0]
end


def zipHash(arr1, arr2)
    if arr1.length != arr2.length
        nil
    else
        hash = {}
        for i in 0..arr1.length - 1
            hash[arr1[i]] = arr2[i]
        end
    end
    hash
end

def hashToArray(hash)
    a = []
    for i in 0..hash.length - 1
        a.push([hash.keys[i], hash.values[i]])
    end
    a
end
