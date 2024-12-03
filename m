Return-Path: <linux-clk+bounces-15286-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7A89E1DEA
	for <lists+linux-clk@lfdr.de>; Tue,  3 Dec 2024 14:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D97A2834A9
	for <lists+linux-clk@lfdr.de>; Tue,  3 Dec 2024 13:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD2821F4297;
	Tue,  3 Dec 2024 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Laz41T5+"
X-Original-To: linux-clk@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645101F4723
	for <linux-clk@vger.kernel.org>; Tue,  3 Dec 2024 13:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233327; cv=none; b=H9RJqBRs8GXlCRLAMMarZU+DbLA1LLj+1afTSmfzgrbGOf67PQVLIs5lL9fLwjKZ/QVtF0tMd5OuLFpOwvHhGlkLn8E297lYq+9Ao46FGwUPjrqydE5gYADgS1VlNXo3FsbWAr115iEme3j4zZCJEPXMQvm+l5tlalR3Akbum68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233327; c=relaxed/simple;
	bh=AvOuBhpS/RO4n/V2TKEgU+sci1oVNo2VYWPMwnRe7lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=f/BA81+17pLSxVr4Sdfdal5aIDLXSw9R7rIzpXTd/jQLYkE8nSH4qZ/L7R9nckWoIVSB8A85zCZq1ko2gpmh7PSf1VmfXoFc+nhTwDHOrETo9OwNsmuNiJjCMKMrcBvoCWOCDQihSmx7uVKcZ8lcU1kx3ti+bjF7CDYkaYwEMPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Laz41T5+; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241203134201euoutp01f27723f55ead5440b597841db5373f38~NroXuipzN2539825398euoutp01b
	for <linux-clk@vger.kernel.org>; Tue,  3 Dec 2024 13:42:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241203134201euoutp01f27723f55ead5440b597841db5373f38~NroXuipzN2539825398euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733233321;
	bh=db70OtbkcGzgNDsJliSTwbkZ7rSF5HHS/kqbDimn6GA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Laz41T5+HmPMIG+67C62UYZmxkD2bCiCaEraeVi+LK/lqaoagaauHUIghzbATyfai
	 P9JFLsCvVMDuQPax1Irbjb8UnfHKOk0Uro5fJBQcnq8NSjEpPglYChhZ+sORD93ISI
	 FBkt7YSEMJEyEe8xelhOA9LAsKgEcVw/FzD8Sgbk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241203134201eucas1p2acef324be66dffaec3a120a1b4da68ad~NroXMQ7zH2525425254eucas1p2C;
	Tue,  3 Dec 2024 13:42:01 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id FC.CA.20821.9AA0F476; Tue,  3
	Dec 2024 13:42:01 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241203134200eucas1p25a1f81ea1ce3f10d507be381da750b31~NroWsSPli0763507635eucas1p25;
	Tue,  3 Dec 2024 13:42:00 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241203134200eusmtrp15f1e86e10afeadabdf4b8e4062a35b0e~NroWrSGoh0887308873eusmtrp1T;
	Tue,  3 Dec 2024 13:42:00 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-80-674f0aa9bd57
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id A3.D8.19920.8AA0F476; Tue,  3
	Dec 2024 13:42:00 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241203134159eusmtip220458ce3abcd87999c00db6ae33bca7d~NroVWYeUR3160631606eusmtip2F;
	Tue,  3 Dec 2024 13:41:59 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
	<m.wilczynski@samsung.com>
Subject: [RFC PATCH v1 09/14] riscv: Enable PM_GENERIC_DOMAINS for T-Head
 SoCs
Date: Tue,  3 Dec 2024 14:41:32 +0100
Message-Id: <20241203134137.2114847-10-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203134137.2114847-1-m.wilczynski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxje6b29tzQpuxScJyBhYFDcXFH2dQzoWDLjTVxQYgbZh9k6uKmk
	fNmCk8kCXaETKIvjQ7YCK1gY0IENtVToBDaGdICCKF/O2rEp2ypUBIQNR2BtL27+e97nfZ73
	ed+Tw8OErYQ/Lyk1g5GlipNDCD5u7lsZfqGJf0iyq8IgQD9NnOOgtn80JGruHOIgbe8QF9mv
	mzhodGmOQOenr5Hoz04FjsYbq0mk7DMQyKGxE2hebeeiG5YqAi0W9wJkXswjUEvvbRIZlrQc
	VDvfhqO6dgtAqoJvuGhkYD9y3FBjSKV5Gq1faifR2ngrjirvd5PINPsFF1lb4lFedxkeHUjP
	TeaT9KzDgdM/nn5I0p3LNTjdoblN0uqOK4A26gsI2jZ+iaC/7o+lfymycugLdTl0Xksfh57r
	GiPoz016QF9XTpD0hcFTh33e4UclMslJJxhZ+L4P+Mcum5ux9DKvk3kVzWQuGCQLgRcPUi9B
	Y6Xdhfk8IdUIYIlzAGOLhwC26PIwt0pILQI4YPV+7LD1V2zwDQB+O/s2a5gFsG70Z89YgoqA
	Uw1arrvhR81gcHLpJuEuMOoPAM13qwi3ypc6DG1tOo8Dp0Lh/eKznrECKhoWrFQCNi4Idv9w
	1cN7ufiZ8kIuq/GB/V/dxd0Yc2mUbZWevSHVxIfr0wqMNb8BJ681cFnsC+9ZTRtXb4GDpWqc
	xWlwqm1hQ58NO9TWDRwJbUOPXIvyXAE7oMESztKvQ33TRQ8NKW846fRhV/CGJWb3q7hpATyt
	ErLqbbBcXfxf6FCjmcNiGlruOMEZEKx54hjNE8do/s+tAZgebGYy5SkSRr47lflIJBenyDNT
	JaKEtBQjcP3qwTXrQjuovjcv6gEcHugBkIeF+AkaDAclQkGiOOtjRpb2viwzmZH3gAAeHrJZ
	EJoYxAgpiTiDkTJMOiN73OXwvPxzOYXKer/X9oRF6Wr7tWZpdmZhuCOpK8qxdUER1jUi3XNE
	FJCucYYONPV/l93LC1erpgX55TqjYkf8+raCi6Qx8GUpcfOZ6E23rh4ZEw9HMPrtSX/HLYfF
	Dfkrvzy5lnHrcsrw/mAvZ+S6tDq//tGd+ZDFT1ZzfM/rEg6KTL9bogJGQjWr9sCZnu53u5eD
	Y65onJ9tqS6LXdl6olS6d6Je9Onep2K+14WXtm6qOVMoVpEHXow9/mbWaNyzHyoGsiJr6v4q
	fv54bpGp6tTUA9srxqbfBOn2qrfeO/pq8kIEXmGwDe/iHvg14ei++hLtztpDRQvxfvadQT45
	2gfEWtiUdjXGdywpBJcfE+9+DpPJxf8C+paWuEQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEKsWRmVeSWpSXmKPExsVy+t/xe7oruPzTDfrWqVqcuL6IyWLr71ns
	Fmv2nmOymH/kHKvFvUtbmCyufH3PZrHu6QV2ixd7G1ksrq2Yy27RfGw9m8XLWffYLD723GO1
	uLxrDpvF594jjBbbPrewWaw9cpfdYv3X+UwWCz9uZbFYsmMXo0Vb5zJWi4unXC1eXu5htmib
	xW/xf88Odot/1zayWMx+t5/dYsubiawWx9eGW7Tsn8LiIOvx/kYru8ebly9ZPA53fGH32Ptt
	AYvHzll32T16dp5h9Ni0qpPN4861PWwe804GetzvPs7ksXlJvUfL2mNMHu/3XWXz6NuyitHj
	UvN1do/Np6sDBKP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
	Uov07RL0Mo5uW8NcMIWzomX6GvYGxtPsXYycHBICJhJ3Tk5n7mLk4hASWMoo0d/wmRkiISNx
	rfslC4QtLPHnWhcbRNErRomzW/+zgSTYBIwkHiyfzwqSEBHoZJF4u3ktI4jDLPCWUeL6zI1g
	7cICfhKPJveD2SwCqhLveqeBreAVcJDo/DmbEWKFvMT+g2fB4pxA8ddTu1hBbCEBe4kdfw+z
	QtQLSpyc+QRsDjNQffPW2cwTGAVmIUnNQpJawMi0ilEktbQ4Nz232FCvODG3uDQvXS85P3cT
	IzCxbDv2c/MOxnmvPuodYmTiYDzEKMHBrCTCu3y9d7oQb0piZVVqUX58UWlOavEhRlOguycy
	S4km5wNTW15JvKGZgamhiZmlgamlmbGSOK/b5fNpQgLpiSWp2ampBalFMH1MHJxSDUyhlzbk
	6em5h31P+JIcvqD/q9eXnOUazwomBqtPLpn5fovj519pjk8nZuSLxgiwyoVKTOzP2HSC/c7H
	9u/8KW5qNqsnhc96mDHrvnLj/1r1OZ45ynm8a9ZI2GwsjC3UW/f9ykkXvogn9zrTNkgmLkk7
	rKy/svl1lbPiv7cP2uvuzcq/IzF/reXMmZevlbbnT76cfmaKImt7pQuH6JbT+xNfhHM3Rkx1
	W3S61HFWQW30piaTJ+5ecyzz/a5tncAfrtySmflmeV31jCPMvV+mRIVtLPU3mXD/dTNzWo5E
	cXh+5WLtI7viv72+t65xkWCwXvNepZ9C6bLL9k709D1zbf9En6jCjoJ3TwtO9ymlpiixFGck
	GmoxFxUnAgCBrnbPtQMAAA==
X-CMS-MailID: 20241203134200eucas1p25a1f81ea1ce3f10d507be381da750b31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241203134200eucas1p25a1f81ea1ce3f10d507be381da750b31
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241203134200eucas1p25a1f81ea1ce3f10d507be381da750b31
References: <20241203134137.2114847-1-m.wilczynski@samsung.com>
	<CGME20241203134200eucas1p25a1f81ea1ce3f10d507be381da750b31@eucas1p2.samsung.com>

T-Head SoCs feature separate power domains (power islands) for major
components like the GPU, Audio, and NPU. To manage the power states of
these components effectively, the kernel requires generic power domain
support.

This commit enables `CONFIG_PM_GENERIC_DOMAINS` for T-Head SoCs,
allowing the power domain driver for these components to be compiled and
integrated. This ensures proper power management and energy efficiency
on T-Head platforms.

By selecting `PM_GENERIC_DOMAINS`, we provide the necessary framework
for the power domain drivers to function correctly on RISC-V
architecture with T-Head SoCs.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index f51bb24bc84c..c414dc618b66 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -48,6 +48,7 @@ config ARCH_THEAD
 	bool "T-HEAD RISC-V SoCs"
 	depends on MMU && !XIP_KERNEL
 	select ERRATA_THEAD
+	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
 
-- 
2.34.1


