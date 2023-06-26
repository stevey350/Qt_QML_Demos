import QtQuick
import QtQuick3D

Node {
    id: node

    // Resources
    PrincipledMaterial {
        id: cottage_FREE_material
        baseColor: "#ffcccccc"
        roughness: 1
        indexOfRefraction: 1
    }

    // Nodes:
    Node {
        id: cottage_FREE_obj
        Model {
            id: cottage_Free
            source: "meshes/cottage_Free.mesh"
            materials: cottage_FREE_material
        }
    }

    // Animations:
}
