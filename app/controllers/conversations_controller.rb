class ConversationsController < ApplicationController
  before_action :set_conversation, except: [:index]
  before_action :check_participating!, except: [:index]

  def show
    @personal_message = PersonalMessage.new
  end

  def index
    @conversations = Conversation.participating(current_user).order('updated_at DESC')
  end

  private

  def set_conversation
    @conversation = Conversation.find_by(id: params[:id])
  end
# make sure that the user is authorized to view the requested conversation
  def check_participating!
    redirect_to root_path unless @conversation && @conversation.participates?(current_user)
  end




end
