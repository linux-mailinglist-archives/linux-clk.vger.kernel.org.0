Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6801F4B40B
	for <lists+linux-clk@lfdr.de>; Wed, 19 Jun 2019 10:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731242AbfFSI3G (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 19 Jun 2019 04:29:06 -0400
Received: from mirror2.csie.ntu.edu.tw ([140.112.30.76]:43366 "EHLO wens.tw"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731135AbfFSI3G (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 19 Jun 2019 04:29:06 -0400
X-Greylist: delayed 356 seconds by postgrey-1.27 at vger.kernel.org; Wed, 19 Jun 2019 04:29:05 EDT
Received: by wens.tw (Postfix, from userid 1000)
        id D29C15FCE5; Wed, 19 Jun 2019 16:23:07 +0800 (CST)
Date:   Wed, 19 Jun 2019 16:23:07 +0800
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] clk: sunxi-ng: clk parent rewrite part 1
Message-ID: <20190619082307.GA27382@wens.csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-ng-parent-rewrite-part-1

for you to fetch changes up to 594d7e8fbe906ad3162ad84ae74acfbdcf8fa3a5:

  clk: sunxi-ng: sun8i-r: Use local parent references for SUNXI_CCU_GATE (2019-06-18 19:53:33 +0800)

----------------------------------------------------------------
Allwinner sunxi-ng clk driver parent relation rewrite part 1

The first part of ongoing work to convert the sunxi-ng clk driver from
using global clock name strings to describe clk parenting, to having
direct struct clk_hw pointers, or local names based on clock-names from
the device tree binding.

This is based on Stephen Boyd's recent work allowing clk drivers to
specify clk parents using struct clk_hw * or parsing DT phandles in the
clk node.

This series can be split into a few major parts:

1) The first patch is a small fix for clk debugfs representation.

2) A bunch of CLK_HW_INIT_* helper macros are added. These cover the
   situations I encountered, or assume I will encounter, such as single
   internal (struct clk_hw *) parent, single DT (struct clk_parent_data
   .fw_name), multiple internal parents, and multiple mixed (internal +
   DT) parents. A special variant for just an internal single parent is
   added, CLK_HW_INIT_HWS, which lets the driver share the singular
   list, instead of having the compiler create a compound literal every
   time. It might even make sense to only keep this variant.

3) A bunch of CLK_FIXED_FACTOR_* helper macros are added. The rationale
   is the same as the single parent CLK_HW_INIT_* helpers.

4) Bulk conversion of CLK_FIXED_FACTOR to use local parent references,
   either struct clk_hw * or DT .fw_name types, whichever the hardware
   requires.

5) The beginning of SUNXI_CCU_GATE conversion to local parent
   references. This part is not done. They are included as justification
   and examples for the shared list of clk parents case.

----------------------------------------------------------------
Chen-Yu Tsai (25):
      clk: Fix debugfs clk_possible_parents for clks without parent string names
      clk: Add CLK_HW_INIT_* macros using .parent_hws
      clk: Add CLK_HW_INIT_FW_NAME macro using .fw_name in .parent_data
      clk: Add CLK_HW_INIT_PARENT_DATA macro using .parent_data
      clk: fixed-factor: Add CLK_FIXED_FACTOR_HW which takes clk_hw pointer as parent
      clk: fixed-factor: Add CLK_FIXED_FACTOR_HWS which takes list of struct clk_hw *
      clk: fixed-factor: Add CLK_FIXED_FACTOR_FW_NAME for DT clock-names parent
      clk: sunxi-ng: switch to of_clk_hw_register() for registering clks
      clk: sunxi-ng: sun8i-r: Use local parent references for CLK_HW_INIT_*
      clk: sunxi-ng: a10: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: sun5i: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: a31: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: a23: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: a33: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: h3: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: r40: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: v3s: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: sun8i-r: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: f1c100s: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: a64: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: h6: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: h6-r: Use local parent references for CLK_FIXED_FACTOR
      clk: sunxi-ng: gate: Add macros for referencing local clock parents
      clk: sunxi-ng: a80-usb: Use local parent references for SUNXI_CCU_GATE
      clk: sunxi-ng: sun8i-r: Use local parent references for SUNXI_CCU_GATE

 drivers/clk/clk.c                        |  44 ++++++++++++-
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c     |  39 +++++++-----
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c    |  41 +++++++-----
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c   |   2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c     |  69 ++++++++++++--------
 drivers/clk/sunxi-ng/ccu-sun5i.c         |  34 ++++++----
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c     |  39 +++++++-----
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c     |  34 ++++++----
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c     |  34 ++++++----
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c      |  29 ++++++---
 drivers/clk/sunxi-ng/ccu-sun8i-r.c       | 104 +++++++++++++++----------------
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c     |  46 +++++++++-----
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c     |  29 ++++++---
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c |  32 ++++++----
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c |  29 ++++++---
 drivers/clk/sunxi-ng/ccu_common.c        |   2 +-
 drivers/clk/sunxi-ng/ccu_gate.h          |  53 ++++++++++++++++
 include/linux/clk-provider.h             |  89 ++++++++++++++++++++++++++
 18 files changed, 526 insertions(+), 223 deletions(-)

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAl0J8OcACgkQOJpUIZwP
JDCCmg/9HW6NnKS0UZglMd9JbGim0X19fvnaG66N5OKSiynJVuKlrjW1KRBjV1yP
f4co5cU9y1eS6yTs4Wat/4iW52Kc88YvT/KZQJFOw36h00zFipGenNPoG5MCnHxE
gNQb/BNKvcNDJp7IIfuddK3zAjtGORQ0HUf/ZbjkacfYKDQ0TbUYpfWlvaGnLSoh
OyL6pww1Tj9zkfRNH4BmFWa1AhCD7ThDfbq4qjGzTSLPbLYTh4IeKDnDnkBU6sif
EZPaRqvwpvpHIJdG3WCL8lmH6TpxO6DK/FnPfkxzNLDD/JtAHJavOx5qQdgJZjuG
hz//AG7OFGmdoSI0Fw0dYabhPJZN6zw/VtapbIMToXHy81Sne9soLlvWfEI1eRgR
Zd63iABZbKoD+HYdEqQea9N4Xqt/pu/Mvy3tzRgXkG2GDyfoyc2SiiGy2abAgTNW
5q7LV6cq+YQQIUIbLA26KmK/NFPDdHoqMObSPiaiC5cQEXTidNsgaqKUigBiTdRN
/0WWF/wtHL2E01OpixYxY5FMb7ciSztJ8VIcAYSbkIVzRgDr4wq1XrYHQPLW9AAu
+ArMNlVyNMyFYXnLBbMkFGZlk2TqZUoo8D4pa29qPIdGSUSSpnA7vWQDAzztiZFQ
v7cnn+hQT7GGB16nSdYsJxdkE8DVMc2YRnz3qOFdYqQahV+wFXs=
=PiPo
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
