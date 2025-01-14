Return-Path: <linux-clk+bounces-17072-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F7DA11021
	for <lists+linux-clk@lfdr.de>; Tue, 14 Jan 2025 19:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C7B21607D8
	for <lists+linux-clk@lfdr.de>; Tue, 14 Jan 2025 18:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B416E1CDA2E;
	Tue, 14 Jan 2025 18:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="XDXCrhrP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iiqUlSVU"
X-Original-To: linux-clk@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470E1FBCB7;
	Tue, 14 Jan 2025 18:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879433; cv=none; b=Y+qSpvlLW7yJ8ZPPTcim1QIuYUSVKxOsTzyLoGBmRjHnVnR1CdfgIv+bkzbaiqwJU7z7IKLgA/erGicJnjRd2tZa675YHGAInyIruTu/AhHSSuJ6WxYOp6W7imBJoNcXdRePoiuvYv7fBOjruBSZDY5hpflKs7cmv9rex3+eIBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879433; c=relaxed/simple;
	bh=IBibhJ70Plnl5aOGJiGyJXDbUgEdckhfBUonIuqZPI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ki70IRf1iI1rzf1yPuVnVjZ1HJK23QR2EqVhHgkUfcMv8JSvicl0wM5GgJOybNVVRC+Q/AcP1wHHLJ+bIXrBHsEOGjdAzF+zUQ/iPBl8WmaogijU0OBrsVszBZtaxoWnyp6/vFsFOPLajwH6Efp+nf/00nFUsDjqi+uBdlwOwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=XDXCrhrP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iiqUlSVU; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9D0EF254018A;
	Tue, 14 Jan 2025 13:30:30 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Tue, 14 Jan 2025 13:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736879430;
	 x=1736965830; bh=gccjNDZjBAahZpa4y9q2b1/0H/y1WIuxemQZFNPSpz8=; b=
	XDXCrhrPoWkElsLjrdI8ZbzlY+94tycdjJvrQEThx35OMqkJekqFWyuPoFBZ7fTB
	l9ZTo06bXszJ9AwapoYpwlGnElJMq5j85LSyVuV7mzBtEI1CXziWAF1Nde231pFZ
	MEoF2mTRRIHkEoUsyTnc+7qKYyTje9mzmHmohDDlnToXoyk2WahAyHyT61SRqA0L
	FGpbMAKx1Q8z5yJhOVtz85TyNYM8G5f7e7ZYjbQOUtoIkmSZzFL1+uhKJkvAvbJv
	Wr6fxaqQPoPnUFxe170uuxg/gNvWfMc2sqQ+Aro67N0t1A3UZj5IbdcH6UL57bFl
	Nr+JeWS1xKuWxG9ZqwfXJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736879430; x=
	1736965830; bh=gccjNDZjBAahZpa4y9q2b1/0H/y1WIuxemQZFNPSpz8=; b=i
	iqUlSVUE24gXlVoB8KfpAZz6XqtQvYRlGu7Mn8cwfF4TSNMPShhSYK2b0cwx+SqG
	7D47HV5rFMKk4/j8nHzHah6e8AZImnGTPvXyE0EG4oS/j+mnysEGKQ5WGjz9Z7+V
	BjvxtMIt9dz6b5vmThLIYwEjM2Clqm9L90wzU/J+yQfC4AAjIGmLEIsGJIYU0Lyi
	bK1pLnd4HzWkgIeHoqhaYYnXZ3zKmobTtGHidUWmDG1HQz8hgFZpJxabPkvfPCYJ
	wRR7hNKFwpWkTgyXi8toS7Tu2sqlzQqGtAVN5P93tjG4nKZnsvmzXDLN3mqw3cDw
	V/YNTRG29SM5HcvoZvuvg==
X-ME-Sender: <xms:Rq2GZ7Kn1njWytLKPDPeOdi79bTLwJ-IXwU56jh-hjyOumFzhvOESw>
    <xme:Rq2GZ_JuHYrph5vHBN_huQ7gD9rRL0Tbdem_D8omn6Js-XEoOBeX9lq9Aj9ENfLF_
    KeZg2UTA_j2w_ZSDaA>
X-ME-Received: <xmr:Rq2GZzsBrlqYC3YSU3J0bOc5S2PbgtbTogNNyKAvAoHQTKzBJcVOv6yuuTDxLYpAbVwQFJDySU1ifxteYxURdacnRg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehiedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgrshcuufpnuggv
    rhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrgh
    hnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedtfefhheegkeev
    tdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhluhhnugesrhgr
    ghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghp
    thhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehlihhnuhigqdgtlhhksehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrg
    hgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:Rq2GZ0b0eIIDSZ2fUsIjbjIyQeGrb3PMI_yGcif7D5dreFCxVNyPng>
    <xmx:Rq2GZyaqwlnP7U32uOjS-BfEeOOKbt5qEhoHm0qR_obpiq6gd5JQGQ>
    <xmx:Rq2GZ4Ayr2xd0RZsvdcsvE71nAhHvFM2RnfIuEREJR6f8gMhl2FtMg>
    <xmx:Rq2GZwYSla7TqX73qq63lW_Kqtt7d9gJQ0v49DkenrdfSyq7dqFQSw>
    <xmx:Rq2GZ5WbOMHDecoM8PWGCo9SXzeHYUxwCBbYVDc7P0af5g8JlhLyEvpt>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jan 2025 13:30:29 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] clk: renesas: r8a779h0: Add ISP core clocks
Date: Tue, 14 Jan 2025 19:30:05 +0100
Message-ID: <20250114183005.2761213-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250114183005.2761213-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250114183005.2761213-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the ISP core module clock for Renesas R-Car V4M.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 607fa815b6c1..4c8052ac32df 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -171,6 +171,7 @@ static const struct cpg_core_clk r8a779h0_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
+	DEF_MOD("isp0",		 16,	R8A779H0_CLK_S0D2_VIO),
 	DEF_MOD("avb0:rgmii0",	211,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb1:rgmii1",	212,	R8A779H0_CLK_S0D8_HSC),
 	DEF_MOD("avb2:rgmii2",	213,	R8A779H0_CLK_S0D8_HSC),
-- 
2.48.0


