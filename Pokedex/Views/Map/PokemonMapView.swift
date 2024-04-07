import SwiftUI
import MapKit

extension Pokemon {
    var location: CLLocationCoordinate2D {
        let lat = Double.random(in: 40.75773...40.8)
        let lon = Double.random(in: (-74.0)...(-73.985708))
        
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}

extension Pokemon {
    func asyncImage() -> some View {
        AsyncImage(url: self.url) { pokeImage in
            pokeImage
                .resizable()
                .scaledToFit()
        } placeholder: {
            VStack(spacing: 10) {
                ProgressView()
                Text("Pokeloading...")
            }
        }
    }
}

struct PokemonMapView: View {
    @State var blur = 0.0
    @State var pokemons: [Pokemon]!
    @State var selectedPokemon: Pokemon? = nil
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708),
                                                   latitudinalMeters: 5000.0,
                                                   longitudinalMeters: 5000.0)
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: pokemons) { item in
                MapAnnotation(coordinate: item.location) {
                    item
                        .asyncImage()
                        .frame(width: 40.0, height: 40.0)
                        .onTapGesture {
                            selectedPokemon = item
                            blur = 5
                        }
                }
            }
            .blur(radius: blur)
            .animation(.linear, value: blur)
            
            if let pokemon = selectedPokemon {
                VStack {
                    pokemon
                        .asyncImage()
                        .frame(width: 90, height: 90)
                    
                    Text(pokemon.name)
                }
                .padding()
                .background(pokemon.color)
                .cornerRadius(15)
                .onTapGesture {
                    selectedPokemon = nil
                    blur = 0
                }
                
            }
        }
    }
}

#Preview {
    PokemonMapView()
}
