require_relative 'robot_controller'
require_relative 'router'

# create controller & router
@controller = RobotController.new
@router = Router.new(@controller)

# start the app
@router.run
