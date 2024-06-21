//
//  EditPieceView.swift
//  WebArchive
//
//  Created by 장세희 on 2024/06/05.
//

import SwiftUI

struct EditPieceView: View {
    @StateObject private var viewModel = CoreDataViewModel.shared
    @Environment(\.managedObjectContext) private var manageObjContext

    @Binding var isPresented: Bool
    
    @State var inputTitle: String = ""
    @State var inputURL: String = ""
    @State var inputDescription: String = ""
    
    @State private var textMessage = false // 오류 메시지 출력 여부 (true일 때 출력)
    
//    func saveContext() {
//        do {
//            try manageObjContext.save()
//        } catch {
//            print("Error saving managed object context: \(error)")
//        }
//    }
//    
//    // MARK: - fetch
//
//    @FetchRequest (
//        entity: Link.entity(),
//        sortDescriptors: [
//            NSSortDescriptor(keyPath: \Link.id, ascending: true)
//        ]
//    ) var links: FetchedResults<Link>

    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack (spacing: 40) {
                    TitleTextFieldView(title: "제목", text: $inputTitle, textField: titleView)
                    TitleTextFieldView(title: "URL", text: $inputURL, textField: urlView)
                    TitleTextFieldView(title: "설명", text: $inputDescription, textField: descriptionView, isOptional: true)
                    // 텍스트 작성
                    TextEditor(text: $inputDescription)
                        .font(.system(size: 18))
                        .lineSpacing(5)
                        .frame(maxWidth: .infinity, minHeight: 300)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                        .padding(.top, 10).ignoresSafeArea()
                    // 여기
                        .scrollContentBackground(.hidden)
                    if inputDescription.isEmpty {
                        Text("placeHolder")
                            .font(.system(size: 18))
                            .foregroundColor(Color("Gray"))
                            .lineSpacing(5)
                        //                    .padding(.top, 18).ignoresSafeArea()
                            .padding(.horizontal, 24)
                    }
                }
                .padding(20)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(leading: Button(action: {
                    self.isPresented = false
                }, label: {
                    Text("취소")
                }), trailing: Button(action: {
                    if (inputTitle == "" || inputURL == "") {
                        // 필수 항목 중 하나라도 빈칸이 있는 경우
                        textMessage = true
                    } else {
                        // TO DO : 데이터 추가 / 수정
                        viewModel.addLink(title: inputTitle, url: inputURL, description_url: inputDescription, url_type: "icon", context: manageObjContext)
                        self.isPresented = false
                    }
                }, label: {
                    Text("확인")
                }))
            }
        }

        .onDisappear() {
            isPresented = false
        }
        
    }
}

extension EditPieceView {
    
    private var titleView: some View {
        TextField("", text: $inputTitle, prompt: Text("제목을 입력하세요").foregroundColor(Color("Gray")))
    }
    
    private var urlView: some View {
        TextField("", text: $inputURL, prompt: Text("URL을 입력하세요").foregroundColor(Color("Gray")))
    }
    
    private var descriptionView: some View {
        TextField("", text: $inputDescription, prompt: Text("설명을 입력하세요").foregroundColor(Color("Gray")))
           .multilineTextAlignment(.leading)
    }

    
}


//struct EditPieceView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditPieceView(isPresented: .constant(true))
//    }
//}

