class PhoneBook
    def initialize
        @listings = {}
    end

    def add(name, number, is_listed)
        # First need to check if the person already exists
        if @listings.key?(name) # Checks if the name is a key in the hash
            return false
        end

        # Then need to check if valid number format
        unless !!(number =~ /^\d{3}-\d{3}-\d{4}$/) #regex for valid phone number
            return false
        end

        # Determine if the number is already listed
        already_listed_match = @listings.values.any?{|entry| entry[:number] == number && entry[:listed]}
        # If the incoming entry wants to be listed but the number is already listed, deny
        if is_listed && already_listed_match
            return false
        end

        # If have made is this far, can add the entry
        @listings[name] = {number:number, listed:is_listed}
        # auto return true
        true

    end
# 
    def lookup(name)
        # return nil unless the name is in the listings
        return nil unless @listings.key?(name)
        # Once verified that name is present, return the number is is_listed
        return @listings[name][:number] if @listings[name][:listed]
        # If not listed, auto return nil
        nil 
    end

    def lookupByNum(number)
        # iterate over each entry 
        @listings.each do |name, data|
            # return the name if the number matches and is_listed
            return name if data[:number] == number && data[:listed]
        end
        # If no match, auto return nil
        nil
    end

    def namesByAc(areacode)
        matching_names = []
        @listings.each do |name, data|
            if data[:number].start_with?(areacode) # no need to check for is_listed
                matching_names << name # append to list 
            end
            # If no match, return empty list
        end
        matching_names
    end
end
