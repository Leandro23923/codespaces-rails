# spec/features/task_creation_spec.rb
require 'rails_helper'

RSpec.feature "Task management", type: :feature do
  scenario "User creates a new task" do
    # Navegar a la página de creación de tareas
    visit new_task_path

    # Rellenar el formulario
    fill_in "Título", with: "Nueva tarea de prueba"
    check "Completado" # Marca la tarea como completada (puedes quitar esta línea si no quieres que se marque)
    
    # Enviar el formulario
    click_button "Crear Tarea"
    
    # Verificar que la tarea fue creada y se muestra en la lista
    expect(page).to have_content("Nueva tarea de prueba")
    expect(page).to have_content("Sí") # Solo si la tarea fue marcada como completada
  end
end