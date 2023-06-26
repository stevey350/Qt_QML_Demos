import QtQuick
import QtQuick.Window
import QtQuick3D

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    View3D {
        id: view3D
        anchors.fill: parent
        environment: sceneEnvironment
        SceneEnvironment {
            id: sceneEnvironment
            antialiasingQuality: SceneEnvironment.High
            antialiasingMode: SceneEnvironment.MSAA
        }

        MouseArea{
            id:mouse
            anchors.fill: parent
            property int cx: 0
            property int cy: 0
            onWheel: {
                if(wheel.angleDelta.y>0)    // rotate up
                    camera.z = camera.z+5
                else
                    camera.z = camera.z-5
            }
            onPressed: {        // 鼠标按下那一时刻的坐标
                cx = mouse.x
                cy = mouse.y
            }

            onPositionChanged: {
                var intervalX = mouse.x-cx
                var intervalY = mouse.y-cy
//                cameraNode.eulerRotation.y = intervalX+cameraNode.eulerRotation.y
//                cameraNode.eulerRotation.x = cameraNode.eulerRotation.x-intervalY
                node.eulerRotation.y = intervalX+node.eulerRotation.y   // 会有跳跃
                node.eulerRotation.x = node.eulerRotation.x-intervalY
                cx = mouse.x
                cy = mouse.y

            }
        }
        Node {
            id: node


            Model {
                id: cubeModel
                source: "test.mesh"
                DefaultMaterial {
                    id: cubeMaterial
                    diffuseColor: "#4aee45"
                }
                materials: cubeMaterial
            }
        }

        Node{
            id:cameraNode

            DirectionalLight {
                id: directionalLight
            }

            PerspectiveCamera {
                id: camera
                z: 15
            }
        }
    }
}
