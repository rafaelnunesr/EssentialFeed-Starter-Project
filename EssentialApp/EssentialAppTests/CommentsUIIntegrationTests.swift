//
//  CommentsUIIntegrationTests.swift
//  EssentialApp
//
//  Created by Rafael Rios on 16/05/25.
//

import XCTest
import UIKit
import Combine
import EssentialApp
import EssentialFeed
import EssentialFeediOS

final class CommentsUIIntegrationTests: FeedUIIntegrationTests {
    
    func test_commentsView_hasTitle() {
        let (sut, _) = makeSUT()
        
        sut.simulateAppearance()
        
        XCTAssertEqual(sut.title, commentsTitle)
    }
    
    func test_loadCommentsActions_requestCommentsFromLoader() {
        let (sut, loader) = makeSUT()
        XCTAssertEqual(loader.loadCommentsCallCount, 0, "Expected no loading requests before view is loaded")
        
        sut.simulateAppearance()
        XCTAssertEqual(loader.loadCommentsCallCount, 1, "Expected a loading request once view is loaded")

        sut.simulateUserInitiatedReload()
        XCTAssertEqual(loader.loadCommentsCallCount, 2, "Expected another loading request once user initiates a load")
        
        sut.simulateUserInitiatedReload()
        XCTAssertEqual(loader.loadCommentsCallCount, 3, "Expected a third loading request once user initiates another load")
    }
    
    override func test_loadingFeedIndicator_isVisibleWhileLoadingFeed() {
        let (sut, loader) = makeSUT()
        
        sut.simulateAppearance()
        XCTAssertTrue(sut.isShowingLoadingIndicator, "Expected loading indicator once view is loaded")

        loader.completeFeedLoading(at: 0)
        XCTAssertFalse(sut.isShowingLoadingIndicator, "Expected no loading indicator once loading completes successfully")

        sut.simulateUserInitiatedReload()
        XCTAssertTrue(sut.isShowingLoadingIndicator, "Expected loading indicator once use initiates a reload")

        loader.completeFeedLoadingWithError(at: 1)
        XCTAssertFalse(sut.isShowingLoadingIndicator, "Expected no loading indicator once user initiated loading completes with error")
    }
    
//    func test_loadFeedCompletion_rendersSuccessfullyLoadedFeed() {
//        let image0 = makeImage(description: "a description", location: "a location")
//        let image1 = makeImage(description: nil, location: "another location")
//        let image2 = makeImage(description: "another description", location: nil)
//        let image3 = makeImage(description: nil, location: nil)
//        let (sut, loader) = makeSUT()
//
//        sut.simulateAppearance()
//        assertThat(sut, isRendering: [])
//
//        loader.completeFeedLoading(with: [image0], at: 0)
//        assertThat(sut, isRendering: [image0])
//
//        sut.simulateUserInitiatedFeedReload()
//        loader.completeFeedLoading(with: [image0, image1, image2, image3], at: 1)
//        assertThat(sut, isRendering: [image0, image1, image2, image3])
//    }
    
    override func test_loadFeedActions_runsAutomaticallyOnlyOnFirstAppearance() {
        let (sut, loader) = makeSUT()
        XCTAssertEqual(loader.loadCommentsCallCount, 0, "Expected no loading requests before view appears")
        
        sut.simulateAppearance()
        XCTAssertEqual(loader.loadCommentsCallCount, 1, "Expected a loading request once view appears")
        
        sut.simulateAppearance()
        XCTAssertEqual(loader.loadCommentsCallCount, 1, "Expected no loading request the second time view appears")
    }
    
//    func test_loadFeedCompletion_doesNotAlterCurrentRenderingStateOnError() {
//        let image0 = makeImage()
//        let (sut, loader) = makeSUT()
//
//        sut.simulateAppearance()
//        loader.completeFeedLoading(with: [image0], at: 0)
//        assertThat(sut, isRendering: [image0])
//
//        sut.simulateUserInitiatedFeedReload()
//        loader.completeFeedLoadingWithError(at: 1)
//        assertThat(sut, isRendering: [image0])
//    }
    
//    override func test_loadFeedCompletion_dispatchesFromBackgroundToMainThread() {
//        let (sut, loader) = makeSUT()
//        sut.simulateAppearance()
//        
//        let exp = expectation(description: "Waiting for background queue")
//        DispatchQueue.global().async {
//            loader.completeFeedLoading(at: 0)
//            exp.fulfill()
//        }
//        
//        wait(for: [exp], timeout: 1)
//    }
    
//    override func test_loadImageDataCompletion_dispatchedFromBackgroundToMainThread() {
//        let (sut, loader) = makeSUT()
//        
//        sut.simulateAppearance()
//        loader.completeFeedLoading(with: [makeImage()])
//        _ = sut.simulateFeedImageViewVisible(at: 0)
//        
//        let exp = expectation(description: "Waiting for background queue work")
//        DispatchQueue.global().async {
//            loader.completeImageLoading(at: 0)
//            exp.fulfill()
//        }
//        
//        wait(for: [exp], timeout: 1)
//    }
    
    override func test_loadFeedCompletion_rendersErrorMessageOnErrorUntilNextReload() {
        let (sut, loader) = makeSUT()
        
        sut.simulateAppearance()
        
        XCTAssertNil(sut.errorMessage)
        
        loader.completeFeedLoadingWithError(at: 0)
        XCTAssertEqual(sut.errorMessage, loadError)
        
        sut.simulateUserInitiatedReload()
        XCTAssertEqual(sut.errorMessage, nil)
    }
    
    override func test_tapOnErrorView_hidesErrorMessage() {
        let (sut, loader) = makeSUT()
        
        sut.simulateAppearance()
        
        XCTAssertNil(sut.errorMessage)
        
        loader.completeFeedLoadingWithError(at: 0)
        XCTAssertEqual(sut.errorMessage, loadError)
        
        sut.simulateErrorViewTap()
        XCTAssertEqual(sut.errorMessage, nil)
    }
    
    // MARK: - HELPERS
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (sut: ListViewController, loader: LoaderSpy) {
        let loader = LoaderSpy()
        let sut = CommentsUIComposer.commentsComposedWith(commentsLoader: loader.loadPublisher)
        trackForMemoryLeaks(loader, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        return (sut, loader)
    }
    
    private func anyImageData() -> Data {
        UIImage.make(withColor: .red).pngData()!
    }
    
    private class LoaderSpy {
        // MARK: - FeedLoader
        private var requests = [PassthroughSubject<[FeedImage], Error>]()
        
        var loadCommentsCallCount: Int {
            requests.count
        }
        
        func loadPublisher() -> AnyPublisher<[FeedImage], Error> {
            let publisher = PassthroughSubject<[FeedImage], Error>()
            requests.append(publisher)
            return publisher.eraseToAnyPublisher()
        }
        
        func completeFeedLoading(with feed: [FeedImage] = [], at index: Int = 0) {
            requests[index].send(feed)
        }
        
        func completeFeedLoadingWithError(at index: Int = 0) {
            let error = NSError(domain: "an error", code: 0)
            requests[index].send(completion: .failure(error))
        }
    }
}
