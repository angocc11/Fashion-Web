(function () {
    const $themeConfig = {
        locale: 'en', // en, da, de, el, es, fr, hu, it, ja, pl, pt, ru, sv, tr, kh
        theme: 'light', // light, dark, system
        menu: 'vertical', // vertical, collapsible-vertical, horizontal
        layout: 'full', // full, boxed-layout
        rtlClass: 'ltr', // rtl, ltr
        animation: '', // animate__fadeIn, animate__fadeInDown, animate__fadeInUp, animate__fadeInLeft, animate__fadeInRight, animate__slideInDown, animate__slideInLeft, animate__slideInRight, animate__zoomIn
        navbar: 'navbar-sticky', // navbar-sticky, navbar-floating, navbar-static
        semidark: false,
    };
	window.addEventListener('load', function () {
	    // Xử lý screen loader
	    const screen_loader = document.getElementsByClassName('screen_loader');
	    if (screen_loader && screen_loader.length > 0) {
	        // Thêm lớp hiệu ứng fade out
	        screen_loader[0].classList.add('animate__fadeOut');
	        
	        // Xóa phần tử khỏi DOM sau hiệu ứng
	        setTimeout(() => {
	            if (screen_loader[0]) { // Kiểm tra phần tử vẫn tồn tại
	                document.body.removeChild(screen_loader[0]);
	            }
	        }, 200); // Thời gian delay phù hợp với hiệu ứng
	    }

	    // Thiết lập giao diện RTL
	    if (typeof Alpine !== 'undefined' && Alpine.store('app')) {
	        Alpine.store('app').setRTLLayout();
	    } else {
	        console.warn('Alpine.js hoặc store "app" không được định nghĩa.');
	    }
	});


    // set current year in footer
    const yearEle = document.querySelector('#footer-year');
    if (yearEle) {
        yearEle.innerHTML = new Date().getFullYear();
    }

    // perfect scrollbar
    const initPerfectScrollbar = () => {
        const container = document.querySelectorAll('.perfect-scrollbar');
        for (let i = 0; i < container.length; i++) {
            new PerfectScrollbar(container[i], {
                wheelPropagation: true,
                // suppressScrollX: true,
            });
        }
    };
    initPerfectScrollbar();

    document.addEventListener('alpine:init', () => {
        Alpine.data('collapse', () => ({
            collapse: false,

            collapseSidebar() {
                this.collapse = !this.collapse;
            },
        }));

        Alpine.data('dropdown', (initialOpenState = false) => ({
            open: initialOpenState,

            toggle() {
                this.open = !this.open;
            },
        }));
        Alpine.data('modal', (initialOpenState = false) => ({
            open: initialOpenState,

            toggle() {
                this.open = !this.open;
            },
        }));

        // Magic: $tooltip
        Alpine.magic('tooltip', (el) => (message, placement) => {
            let instance = tippy(el, {
                content: message,
                trigger: 'manual',
                placement: placement || undefined,
                allowHTML: true,
            });

            instance.show();
        });

        Alpine.directive('dynamictooltip', (el, { expression }, { evaluate }) => {
            let string = evaluate(expression);
            tippy(el, {
                content: string.charAt(0).toUpperCase() + string.slice(1),
            });
        });

        // Directive: x-tooltip
        Alpine.directive('tooltip', (el, { expression }) => {
            tippy(el, {
                content: expression,
                placement: el.getAttribute('data-placement') || undefined,
                allowHTML: true,
                delay: el.getAttribute('data-delay') || 0,
                animation: el.getAttribute('data-animation') || 'fade',
                theme: el.getAttribute('data-theme') || '',
            });
        });

        // Magic: $popovers
        Alpine.magic('popovers', (el) => (message, placement) => {
            let instance = tippy(el, {
                content: message,
                placement: placement || undefined,
                interactive: true,
                allowHTML: true,
                // hideOnClick: el.getAttribute("data-dismissable") ? true : "toggle",
                delay: el.getAttribute('data-delay') || 0,
                animation: el.getAttribute('data-animation') || 'fade',
                theme: el.getAttribute('data-theme') || '',
                trigger: el.getAttribute('data-trigger') || 'click',
            });

            instance.show();
        });

        // main - custom functions
        Alpine.data('main', (value) => ({}));

        Alpine.store('app', {
            // theme
            theme: Alpine.$persist($themeConfig.theme),
            isDarkMode: Alpine.$persist(false),
            toggleTheme(val) {
                if (!val) {
                    val = this.theme || $themeConfig.theme; // light|dark|system
                }

                this.theme = val;

                if (this.theme == 'light') {
                    this.isDarkMode = false;
                } else if (this.theme == 'dark') {
                    this.isDarkMode = true;
                } else if (this.theme == 'system') {
                    if (window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches) {
                        this.isDarkMode = true;
                    } else {
                        this.isDarkMode = false;
                    }
                }
            },

            // navigation menu
            menu: Alpine.$persist($themeConfig.menu),
            toggleMenu(val) {
                if (!val) {
                    val = this.menu || $themeConfig.menu; // vertical, collapsible-vertical, horizontal
                }
                this.sidebar = false; // reset sidebar state
                this.menu = val;
            },

            // layout
            layout: Alpine.$persist($themeConfig.layout),
            toggleLayout(val) {
                if (!val) {
                    val = this.layout || $themeConfig.layout; // full, boxed-layout
                }

                this.layout = val;
            },

            // rtl support
            rtlClass: Alpine.$persist($themeConfig.rtlClass),
            toggleRTL(val) {
                if (!val) {
                    val = this.rtlClass || $themeConfig.rtlClass; // rtl, ltr
                }

                this.rtlClass = val;
                this.setRTLLayout();
            },

            setRTLLayout() {
                document.querySelector('html').setAttribute('dir', this.rtlClass || $themeConfig.rtlClass);
            },

            // animation
			animation: Alpine.$persist($themeConfig.animation),
			toggleAnimation(val) {
			    // Nếu val không có giá trị, gán giá trị mặc định từ this.animation hoặc $themeConfig.animation
			    if (!val) {
			        val = this.animation || $themeConfig.animation; 
			        // Các giá trị mẫu: animate__fadeIn, animate__fadeInDown, animate__fadeInLeft, animate__fadeInRight
			    }

			    // Kiểm tra val, nếu có giá trị thì trim
			    if (val) {
			        val = val.trim();
			    }

			    // Gán giá trị mới cho animation
			    this.animation = val;
			},


            // navbar type
            navbar: Alpine.$persist($themeConfig.navbar),
            toggleNavbar(val) {
                if (!val) {
                    val = this.navbar || $themeConfig.navbar; // navbar-sticky, navbar-floating, navbar-static
                }

                this.navbar = val;
            },

            // semidark
            semidark: Alpine.$persist($themeConfig.semidark),
            toggleSemidark(val) {
                if (!val) {
                    val = this.semidark || $themeConfig.semidark;
                }

                this.semidark = val;
            },

            // multi language
			locale: Alpine.$persist($themeConfig.locale),
			toggleLocale(val) {
			    // Nếu val không có giá trị, dùng giá trị mặc định
			    if (!val) {
			        val = this.locale || $themeConfig.locale;
			    }

			    // Gán giá trị mới cho locale
			    this.locale = val;

			    // Kiểm tra locale và thay đổi hướng giao diện
			    if (this.locale && this.locale.toLowerCase() === 'ae') {
			        this.toggleRTL('rtl'); // Thiết lập RTL
			    } else {
			        this.toggleRTL('ltr'); // Thiết lập LTR
			    }
			},


            // sidebar
            sidebar: false,
            toggleSidebar() {
                this.sidebar = !this.sidebar;
            },
        });
    });
})();
