Return-Path: <linux-clk+bounces-26000-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9901B242B1
	for <lists+linux-clk@lfdr.de>; Wed, 13 Aug 2025 09:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87B991BC2D89
	for <lists+linux-clk@lfdr.de>; Wed, 13 Aug 2025 07:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE1A2D640E;
	Wed, 13 Aug 2025 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b="FYPI5oTP"
X-Original-To: linux-clk@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1CE2D7392;
	Wed, 13 Aug 2025 07:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755070060; cv=pass; b=OY4J/VxhVjIYlO/CNHVq0eobZsAt3IWqaovoGHB+OK3QrnXGpqlwOCd6lc4aBOdkV5teiLN/JqSoVE+/i6i3VXgRvvby2wa3Iz7xYMsSYopj/yv6sK4L2iWtVEAKBdfwgXn04jaKgW6T0EaHYnq+T6Ep8tO6VFkNJZZZBFIDNAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755070060; c=relaxed/simple;
	bh=6L7lO6lRUkNyvtX3U2zjNywlE97qvdUBrXDL2ZI9QXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNkBDPpwy4dpxAQ9j4geK/jukm7v5dNnah9Be8FtYT9EzVTT8eq4uavwMWVswNejfh8oMV16E5npUCdAvHlV/JhmJPzbVrCuOb/meKtUi7tCdgFm+gY95l9kbpgYe3ir4Imy6BsjgRDTN+J0ehzPOTZ9YPki6r84aL2X/TNoxYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me; spf=pass smtp.mailfrom=icenowy.me; dkim=pass (2048-bit key) header.d=icenowy.me header.i=uwu@icenowy.me header.b=FYPI5oTP; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1755070043; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wwb3hLG4RZqGskVBpAUotm2xu9JzuoQmaiHSvUAXdKgEtSJ7FY/4Y1BeWWhNV2sbT7zVe/AXsF1XPcC4Z4p9/OsKjXot7XFUDwg7YXuVdxCEmfvF6mFKwuXoCTvRAS2DKlyjB1MLIyCmGh2bUY+2bEWmJ+BvGTRVQd4VMLZIzbI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755070043; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ndGRIgyqpSoyEUU8zgnuxG9P6Dpgn6Lze4upIdgAB94=; 
	b=efjvs8JL0prlmwrd259yGTJZtnu7Y4uQXmTtAYTnbePRDEOTjAb6QPFT6pQKKHF5RUZgqvtVjZz91XOMcUSOyQDlXkMZXPnh0YyK09QKjgriVt5NcLgJV5OvKMv3fOgYOC6fcZoMlZCI8AKXwAqWUHLyuqCYcOZn4n47TrhV90o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755070043;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ndGRIgyqpSoyEUU8zgnuxG9P6Dpgn6Lze4upIdgAB94=;
	b=FYPI5oTPPGpG0FGzGJBcE2IrCwEeYjC1rCOfndyR+2/yb5lWbjcNVQ3wlTGSmgLR
	szRgCeKqfYXUdDbGFb/LkRy6WAVHIXQEmnBE4uMoodlIgKyWwEYtSKx3Cm00gqyD5Im
	4+3Xh6mpziTyemFoqbda2xnZB8h4AUTji3VucXzmX+d1o05Y7hf0v9GyA7N5oGgidfM
	dx50zl8VZ61Q+YqmQEM6a+vcYLw8sACIwhwS7lVdjULZKIYkorQsfCpg9q3hQotkKtO
	4LPaYUQTrmQhWTdkSzd5uklGIboNoPFfrY2q2pDYURNLhbbatyqjerMykt5sHMsdI+m
	TqrelN0Kig==
Received: by mx.zohomail.com with SMTPS id 1755070041223966.9782012385351;
	Wed, 13 Aug 2025 00:27:21 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Yao Zi <ziyao@disroot.org>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 0/3] clk: thead: Changes to TH1520 clock driver for disp
Date: Wed, 13 Aug 2025 15:26:59 +0800
Message-ID: <20250813072702.2176993-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This patchset is my changes to the TH1520 clock driver, mainly for
supporting the display controller.

The first two are functionality additions, with the first one adding
support for enabling/disabling PLLs (for DPU PLL) and the second one
adding support for changing DPU dividers.

The 3rd one is to address hang issues met when testing the DPU driver
w/o clk_ignore_unused command line option.

The 4th patch that used to be in v1 is dropped, makes this patchset
purely display-related.

This patchset has a dependency (a 0th one) [1].

[1] https://lore.kernel.org/linux-riscv/20250809-fix_clocks_thead_aug_9-v1-1-299c33d7a593@samsung.com/

Icenowy Zheng (3):
  clk: thead: add support for enabling/disabling PLLs
  clk: thead: support changing DPU pixel clock rate
  clk: thead: th1520-ap: set all AXI clocks to CLK_IS_CRITICAL

 drivers/clk/thead/clk-th1520-ap.c | 146 +++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 32 deletions(-)

-- 
2.50.1


