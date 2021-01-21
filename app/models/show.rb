class Show <ActiveRecord::Base

    ##all the tests pass except the one that is dependent on the different naming of one of my migrates.

    def self.highest_rating
        self.maximum(:rating)
    end

    def self.lowest_rating
        self.minimum(:rating)
    end

    def self.most_popular_show
        self.find_by(rating: self.highest_rating)
    end

    def self.least_popular_show
        self.find_by(rating: self.lowest_rating)
    end

    def self.ratings_sum
       self.all.sum{|show| show.rating}
    end

    def self.popular_shows(under_limit=5)
        self.all.select{|show| show.rating>under_limit}
    end

    def self.shows_by_alphabetical_order
        self.all.sort_by{|show| show.name}
    end


end