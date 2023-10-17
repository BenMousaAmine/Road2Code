//
//  QuizStart.swift
//  Road2Code
//
//  Created by user245218 on 10/14/23.
//

import SwiftUI
import Supabase

struct QuizInfo: Codable , Identifiable  {
    let id = UUID()
    var tempo: String
}
class Api : ObservableObject {
    @Published var quiz = ErrorMessage()
    
    func loadData (completion : @escaping (ErrorMessage)->()){
        guard let url = URL(string: "https://ywsbqtupbreoiylewpxr.supabase.co/rest/v1/Quiz?select=Tempo")else {
            print ("invalid url ")
            return ;
        }
        URLSession.shared.dataTask(with: url ){data ,response , error in
            let quiz = try! JSONDecoder().decode(ErrorMessage.self , from: data!)
            DispatchQueue.main.async{
                completion(quiz)
            }
        }.resume()
    }
}


struct QuizStart: View {
    let language: String
    @State private var Argomenti: String = ""
    @State private var tempo: String  = ""
    @State var quizs = [QuizInfo]()
    
    
    var body: some View {
        
        List(quizs){ quiz in
            VStack{
                VStack {
                    Image(language)
                        .resizable()
                        .frame(width: 200, height: 120, alignment: .bottom)
                }
                VStack{
                    Text(language)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.CustomColor)
                        .bold()
                        .padding()
                    Text("Argomenti: \(Argomenti)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.CustomColor)
                    Text("TEMPO: \(quiz.tempo)")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.CustomColor)
                }
                .frame(width: 350.0, height: 400.0)
                .border(Color.CustomColor, width: 2)
                .padding(10)
                
            }
        }
            HStack {
                NavigationLink(destination: Quiz()) {
                    Text("Inizia quiz")
                        .frame(width: 250, height: 45)
                        .font(.system(size: 26))
                        .foregroundColor(Color.white)
                        .padding(5)
                }.background(Color.CustomColor)
                    .cornerRadius(10)
                    .padding(10)
            }
        }
    }



struct QuizStart_Previews: PreviewProvider {
    static var previews: some View {
        QuizStart(language: "Java")
    }
}
