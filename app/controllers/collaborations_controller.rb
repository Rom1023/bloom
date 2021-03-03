class CollaborationsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @collaboration = Collaboration.new(user: current_user, project: @project, role: :collaborator)
    @collaboration.save
    redirect_to @project
  end

  def index
  end
end

=begin
-[ ] criar rotas
-[ ] adicionar botao na view
-[ ] admin nao pode ver botao
-[ ] usuario colaborador nao pode ver botao
-[ ] botao cria colaborador
-[ ] botao redireciona para project show
POST "/projects/6/collaborations"

=end
