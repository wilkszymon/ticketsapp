class Search < ApplicationRecord

    def search_tickets
        tickets = Ticket.all

        tickets = tickets.where(["name LIKE ?", name]) if name.present?
        tickets = tickets.where(["description LIKE ?", description]) if description.present?
        tickets = tickets.where(["city LIKE ?", city]) if city.present?
        tickets = tickets.where(["important IS ?", important])

        return tickets
    end

end
