Return-Path: <linux-clk+bounces-11340-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B019629B3
	for <lists+linux-clk@lfdr.de>; Wed, 28 Aug 2024 16:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0080B284186
	for <lists+linux-clk@lfdr.de>; Wed, 28 Aug 2024 14:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8574F189502;
	Wed, 28 Aug 2024 14:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GPyZoq5s"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37739188CDC
	for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724853978; cv=none; b=YbcPeiuiviJeKyr/R6PwYOjnzFO755XdYwuwHA7P2MKTr9hT5u5gF2fuR8rhUlwMjuWv9QdnrXZWTnw8Eh6NZzzshPQxXsmZ7Rs9ilR/rNOXJWMYFNqt28v5EdJzRB56QtyKMvSvefv5UqQ/S7275MS8MAMeD5eb9DiaRr465/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724853978; c=relaxed/simple;
	bh=n/Pkll2/aYd2MGCXDtO54pgr7iCEGk5UA5Nv9TSmr2I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TUH1U30Dn7bvmwZg09OEZmTsFGv9hzO3SMQ4w8z5eqji3U9m1BovtnPE1g944S9G7sH8FRnIDvSt4N2483h/QTTs712jlRWp6c/+arFy0LVwK01I1Lj2J3H50l5zH9WvWdJ68DDDNB7L+DaAi724WiHGpElK2+EmgfmCz6KBWk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GPyZoq5s; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a868b8bb0feso739311866b.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 07:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724853974; x=1725458774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/2opj3/jkFrjiKQvIyMUHejfhmR0t0gPFQPbv+1tYrc=;
        b=GPyZoq5sWFqXf+qNlZvklYAFfm4//vO35Va2suBOq15mHVcFmPL8qrQpiV+ttsC2M2
         DhEIp1KfE7emmbWc4QVhyXqsv+U4HLz1ZWH+kzu2j8OYYLi56/AktPPKdKW1aGI/U1ID
         ENXCzWorn93WGly2Cz4/dZko9rzv+IWcF4KuSacG6xaoMq7tT09hF9Szch2jgfwRK/2g
         lzcUUNhkaV4z0/CqcwA/Vq3QtWHk5VL79PdvDhtLhjhPOCajShbDTp9zP12ft2TJAQ18
         +kn+V8+BAz2E8dJGt/JP7r5RPk2ZmKjz6w5yVCdM67w59b2FcYBA5XPX0pDwCV9vgutD
         P+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853974; x=1725458774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/2opj3/jkFrjiKQvIyMUHejfhmR0t0gPFQPbv+1tYrc=;
        b=ZhyM7t3nEuQAlDCj01Q6SzI9lTRK1jAiOhobP50jAeuuQ+v1ydtyYriQMYJY5ht2QH
         QjlTEfVGPHq+exrZQ+lhLIq+9bIcFGxmdsmU3h1reDGTgzopqyV16bf0puEBUwZC0Ld4
         ePn5/lyQkHi7t6QbYbs3B+FQ9fkDn7+Eu1r2nIJ2BbuiZj4jXYi6KmztzIm7Qa3Op1mC
         WSOU1tfoiuWxRoVJL3kPzKWdkWQ5cLaUngWhVRyedCiRnpzj4+KNyVrNtb9FuWw38J4r
         cDxbWpw6I0oBkazJh5Zhbus3Z8ku2a/+zrMW5CEKLVium2l5/LfPpQB4gCQZgWlD4CON
         N1uw==
X-Forwarded-Encrypted: i=1; AJvYcCUBXp+xJzvBYojR/BVtvY2D/hw2sYB3/ax5A8Q2+3WUI7+at/ihd79upXJq4Kfunn4A34nrFe7kTUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh27YIWBP3AEL6uHtpevmnEAPW0nh+QTU6zf/l/Tjz+H+PRmCP
	UttzLl0/4ETT4M9KV259SIaGOSKZRuYeVn/6eTO7Z1+Ta0mQ4mUWgh3YVLIxgvo=
X-Google-Smtp-Source: AGHT+IHX2ETE7Utzz1hpIpA9XUWQb8Cecp0VRFYEzjPCMYMPZgmKWyHJGF7yUlp5tC4+gxLSZmkcaw==
X-Received: by 2002:a17:907:f1cd:b0:a86:743e:7a08 with SMTP id a640c23a62f3a-a870aa17258mr155752266b.31.1724853972746;
        Wed, 28 Aug 2024 07:06:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e54b50dbsm251875666b.93.2024.08.28.07.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 07:06:12 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/3] watchdog: rzg2l_wdt: Enable properly the watchdog clocks and power domain
Date: Wed, 28 Aug 2024 17:05:59 +0300
Message-Id: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Watchdog device available on RZ/G3S SoC is part of a software-controlled
power domain. The watchdog driver implements struct
watchdog_ops::restart() handler which is called in atomic context via
this call chain:

kernel_restart() ->
  machine_restart() ->
    do_kernel_restart() ->
      atomic_notifier_call_chain() ->
        watchdog_restart_notifier()
          rzg2l_wdt_restart()

When the rzg2l_wdt_restart() is called it may happen that the watchdog
clocks to be disabled and the associated power domain to be off.
Accessing watchdog registers in this state leads to aborts and system
blocks.

To solve this issue the watchdog power domain was marked as IRQ safe
as well as watchdog device (as proposed by Ulf Hansson). Along with
it the clk_prepare_enable() calls from the watchdog restart() handler
were removed and all is based now on pm_runtime_resume_and_get()
as explained in patch 03/03.

Series contains also power domain driver changes to be able to
register the watchdog PM domain as an IRQ safe one.

Initial RFC series for solving this issue was posted at [1].

It is safe to merge watchdog and PM domain driver changes though
different trees.

Thank you,
Claudiu Beznea

[1] https://lore.kernel.org/all/20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com/

Changes in v2:
- adjusted patch title for patch 02/03
- adjusted description for patch 03/03 along with comment
  from code

Changes since RFC:
- dropped patches 01/03, 02/03 from RFC
- adjusted power domain driver to be able to register the
  watchdog PM domain as an IRQ safe one
- drop clock prepare approach from watchdog driver presented in RFC
  and rely only on pm_runtime_resume_and_get()
- mark the watchdog device as IRQ safe

Claudiu Beznea (3):
  clk: renesas: rzg2l-cpg: Use GENPD_FLAG_* flags instead of local ones
  clk: renesas: r9a08g045: Mark the watchdog and always-on PM domains as
    IRQ safe
  watchdog: rzg2l_wdt: Power on the watchdog domain in the restart
    handler

 drivers/clk/renesas/r9a08g045-cpg.c | 43 ++++++++++++-----------------
 drivers/clk/renesas/rzg2l-cpg.c     | 13 +++++----
 drivers/clk/renesas/rzg2l-cpg.h     | 10 ++-----
 drivers/watchdog/rzg2l_wdt.c        | 20 ++++++++++++--
 4 files changed, 46 insertions(+), 40 deletions(-)

-- 
2.39.2


