class Ability
    include CanCan::Ability

    def initialize(user)

    
            @user = user || User.new # for guest
            #@user.roles.each { |role| send(role) }
        
            if @user.role == 'ong'
              self.ong
                #can :read, :all #for guest without roles
            elsif @user.role == 'admin'
                self.admin
            elsif @user.role == '' || @user.role == nil || @user.role == 'usuario'
                self.user
            end
        
        
     
        #
        # The first argument to `can` is the action you are giving the user 
        # permission to do.
        # If you pass :manage it will apply to every action. Other common actions
        # here are :read, :create, :update and :destroy.
        #
        # The second argument is the resource the user can perform the action on. 
        # If you pass :all it will apply to every resource. Otherwise pass a Ruby
        # class of the resource.
        #
        # The third argument is an optional hash of conditions to further filter the
        # objects.
        # For example, here the user can only update published articles.
        #
        #   can :update, Article, :published => true
        #
        # See the wiki for details:
        # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    end
    def ong
        can :manage, User
        can :manage, Ong

    end

    def user
        can :read, :all
    end
    
    def admin
        can :manage, User
     
    end

    
end
