require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one) # Usa un fixture o crea una tarea de ejemplo
  end

  # Test para la acción index
  test "should get index" do
    get tasks_url
    assert_response :success
  end

  # Test para la acción show
  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  # Test para la acción new
  test "should get new" do
    get new_task_url
    assert_response :success
  end

  # Test para la acción create
  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { title: 'New Task', completed: false } }
    end
    assert_redirected_to task_url(Task.last)
  end

  # Test para la acción edit
  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  # Test para la acción update
  test "should update task" do
    patch task_url(@task), params: { task: { title: 'Updated Task', completed: true } }
    assert_redirected_to task_url(@task)
  end

  # Test para la acción destroy
  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end
    assert_redirected_to tasks_url
  end
end