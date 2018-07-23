            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="${goRoot}admin/"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#menu1"><i class="fa fa-fw fa-arrows-v"></i> 회원관리 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="menu1" class="collapse">
                            <li><a href="${goRoot}admin/member/normal/">일반회원</a></li>
                            <li><a href="${goRoot}admin/member/company/">기업회원</a></li>
							<li><a href="${goRoot}admin/member/emp/">직원관리</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="${goRoot}admin/member/review/"><i class="fa fa-fw fa-edit"></i>리뷰</a></li>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#menu2"><i class="fa fa-fw fa-arrows-v"></i> 매거진 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="menu2" class="collapse">
                            <li><a href="${goRoot}admin/member/normal/">전체보기</a></li>
                            <li><a href="${goRoot}admin/member/company/">글쓰기</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#menu2"><i class="fa fa-fw fa-arrows-v"></i> 이벤트 <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="menu2" class="collapse">
                            <li><a href="${goRoot}admin/event/">전체보기</a></li><!--  ${goRoot}admin/event/addr/-->
                            <li><a href="${goRoot}admin/event/add/">글쓰기</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#menu3"><i class="fa fa-fw fa-arrows-v"></i> 상품관리  <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="menu3" class="collapse">
                            <li><a href="${goRoot}admin/item/">전체보기</a></li>
                            <li><a href="${goRoot}admin/item/add/">등록하기</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#menu4"><i class="fa fa-fw fa-arrows-v"></i> 통계  <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="menu4" class="collapse">
                            <li><a href="${goRoot}admin/chart/login/">접속자수</a></li>
                            <li><a href="${goRoot}admin/chart/review/"></a>리뷰</li>
                            <li><a href="${goRoot}admin/chart/review/"></a>매거진</li>
                            <li><a href="${goRoot}admin/chart/review/"></a>이벤트</li>
                            <li><a href="${goRoot}admin/chart/like/"></a>좋아요</li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#menu5"><i class="fa fa-fw fa-arrows-v"></i> 로그  <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="menu5" class="collapse">
                            <li><a href="${goRoot}admin/log/">전체로그</a></li>
                            <li><a href="${goRoot}admin/log/error/"></a>에러로그</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        <!-- Navigation END TODO:탬플릿해야됨 -->