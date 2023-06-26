import QtQuick
import QtQuick.Window
import QtQuick3D

Window {
    width: 640
    height: 480
    visible: true
    color: "#4A4A4A"
    title: qsTr("Hello Qt Quick 3D")

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
                if(wheel.angleDelta.y>0)
                    camera.z = camera.z+5
                else
                    camera.z = camera.z-5
            }
            onPressed: {
                cx = mouse.x
                cy = mouse.y
            }

            onPositionChanged: {
                var intervalX = mouse.x-cx
                var intervalY = mouse.y-cy
                cameraNode.eulerRotation.y = intervalX+cameraNode.eulerRotation.y
                cameraNode.eulerRotation.x = cameraNode.eulerRotation.x-intervalY
                cx = mouse.x
                cy = mouse.y

            }
        }

        Node {
            id: node

            Model {
                id: cubeModel
                source: "test.mesh"

                materials: PrincipledMaterial {
                    id: cubeMaterial
//                    baseColor: "#e9d805"
//                    baseColor: "#FFD700"    // 金
                    baseColor: "#FFFFF0"    // 象牙
                    roughness: 0.4      // 模型表面反射光线的强度
                    metalness: 0.8      // 金属质感程度
                }
            }
        }

        Node{
            id:cameraNode

            DirectionalLight {
                id: directionalLight
                brightness: 10
                castsShadow: true
            }


            PerspectiveCamera {
                id: camera
                z: 15
            }
        }
    }
}
