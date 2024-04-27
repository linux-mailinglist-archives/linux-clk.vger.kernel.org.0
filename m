Return-Path: <linux-clk+bounces-6448-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B498B430E
	for <lists+linux-clk@lfdr.de>; Sat, 27 Apr 2024 02:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6CF92847E1
	for <lists+linux-clk@lfdr.de>; Sat, 27 Apr 2024 00:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFC56FA7;
	Sat, 27 Apr 2024 00:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Cy8eTFD/"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659124411
	for <linux-clk@vger.kernel.org>; Sat, 27 Apr 2024 00:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714176658; cv=none; b=V3HwqDDw24u4VS8tRb2vcMXd3w+Cy08yAZ+7EJyzmC8S3RV2+yy+rlGfssM4dFiG5EJfIMZVjCT808ocVxs0sjlcw+1KdwpSsiLfWpTiA+z2RaPNJrxNzcWLN3qOWIwzwTHgHxtMUaDz0kgy60jugOaKXKUa/CgqRQhl2G8Ai28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714176658; c=relaxed/simple;
	bh=1J4s5WkWi0yLsfAU04plHcZTJmipLje1WXfb8fgGcxc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e/Iz91lFDzaaMDneNHgDAe3nK/kbruzLGbvKwA8zZ45OgreDji76aJwHraBS+uKZTI1drPj/6bjmqil+aLSvDHAQRoEl+pGfUBg6sbQrf44MYeI26vHmXHSqhTRjTQ5Tkusv7lZTl5O5vfb+4UdXsb/tZqYZmhue1WAyrwotBmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Cy8eTFD/; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6f0b9f943cbso2440077b3a.0
        for <linux-clk@vger.kernel.org>; Fri, 26 Apr 2024 17:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1714176656; x=1714781456; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0X+wom0kXrBkkWPdMk9ez0NtFShVE5HcObxG7YQSUEM=;
        b=Cy8eTFD/FEoAkS25A5xZLRFggXIjlGWkaYvwFPIs1Net4uSzDwvrNHxai53MuNxAil
         h7CJueS3uvs20mNK9nUZZC7ZJU2zqvUA83II2h14nZNRfIxYfOJF7C3s6XnY1nVobbr1
         dgE92UCjwACYt+Zqj/UvTYrNGKJihqNkQEXZnCMDlQ+P35LPE/2euXMZkqPiKO62jErZ
         9D+vTcUPMVaYBnJhINp5Cn/6rOYMRjzQ/hltDeKl09B3EjcPU1wNG2QsojLgV6pfiJF+
         RohBdtbXeaFH6LA7yh+SxwCIj3PjY8tQWIDA/mK58lbjau0159mAYxp/aCM0CgvMbFCM
         D8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714176656; x=1714781456;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0X+wom0kXrBkkWPdMk9ez0NtFShVE5HcObxG7YQSUEM=;
        b=qqidyoxVr4S4lN/rpRWaGSRtMD1vgpxQouoxil9i82tslt+5yIFr1mwIs/LYVaVTb2
         bekIFsBjDrzymP+P9+DICA2AlgtF902N5DTbsCvBVqHdUPlZBf3HGZTT0/zVI5I1smIQ
         uJD7dhbGB/JXQJCdvva3rAsroQxd2xcrBYmpsjJS8UXIfo62CBlSVAxgiXcw0IRWty1W
         wyHXTvh/wMDjUnEuGrVMnm5YJS6mDBP/ubf3zN9YFCa8fXCwrnZkcLbb1tbZSAodLDMj
         Z++NmvStcd0+UMqTuKVkCUzpS+IGK2bDqm8djBM0hEp36xdmFCC7t5vRsXKkfphBNXpO
         7hNA==
X-Forwarded-Encrypted: i=1; AJvYcCX51f/a6tDaF6+nbxr6wz6RZpF5Qr+zrvN9wsla+ojn3FmykRNzUklZokWub1mcGGCKwlXNX56Mxa+P+zwyS1I2ENSiH/H7P+wd
X-Gm-Message-State: AOJu0Yy5iNLmVPIWV0HBRtq7p128XcQ8jlUpaf8whwaYwKbRYhSkLpyB
	u9Gnbeomh5H/+9/KvxAbGwAhjqkP/uEVkgxIQv0EK1HbQGii/Su+aW5OdPafFBA=
X-Google-Smtp-Source: AGHT+IEjEz8x5csAstQe+EBoqyrLMV5so95s3NngLWP1s+99Pa2FDBg9Mqljlc51ovwGOiHviBdhsg==
X-Received: by 2002:a05:6a20:d80a:b0:1ad:22bd:d6d8 with SMTP id iv10-20020a056a20d80a00b001ad22bdd6d8mr6019864pzb.4.1714176655738;
        Fri, 26 Apr 2024 17:10:55 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:3569:7ce4:94b8:1691])
        by smtp.gmail.com with ESMTPSA id w1-20020a6556c1000000b005f3d54c0a57sm6061883pgs.49.2024.04.26.17.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 17:10:55 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH RFC v2 0/4] clk: thead: Add support for TH1520 AP_SUBSYS
 clock controller
Date: Fri, 26 Apr 2024 17:10:33 -0700
Message-Id: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHlCLGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxMDEyMz3ZIMQ1MjA93knGzdMiNdQ2OTpLRky6SUlCRDJaCegqLUtMwKsHn
 RSkFuzkqxtbUA48+/pmQAAAA=
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714176654; l=3100;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=1J4s5WkWi0yLsfAU04plHcZTJmipLje1WXfb8fgGcxc=;
 b=16J/aGmQTihk3ouk4xY9w2E0cZ7vJ10E2613HxJBuwgVbWNSdlKeA297VRG2X2bxYYqhOPTFB
 RTLq0s2TI/CAKc6fCIJa2p7mV/aGGNK+RMCY6OK3Lv3pbwdj8KTczZC
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=

This series adds support for the AP sub-system clock controller in the
T-Head TH1520 [1]. Yangtao Li originally submitted this series in May
2023 [2]. Jisheng made additional improvements and then passed on the
work in progress to me.

Changes I made from the original series:
 - corrected the npu_clk enable bit
 - deduplicated CLK_NPU and CLK_NPU_AXI number in header
 - fixed c910_i0_clk reg typo
 - fixed checkpatch and dt_binding_check warnings 
 - rebased on v6.9-rc5
 - revised commit descriptions

Changes since my RFC v1 [4]:
 - squash the header file patch into the DT schema patch
 - describe the changes I made to original series in the cover letter
   instead of the individual patches
 - fix my typo in my email address

TODO:
I am again marking this as an RFC because there is feedback from v1 that
I have not yet addressed. I am posting what I currently have as other
patch series like the TH1520 I2C driver [4] could use the clk driver.

Emil commented that the input predivider is not handled correctly in
ccu_mdiv_recalc_rate(). The PLL multiplies the input frequency and
outputs "Foutvco". This is followed by a post divider to produce
"Foutpostdiv". However, some clocks derive directly from the "Foutvco"
Emil suggested this should really be modeled as two different clocks.

Emil aslo suggested that the rest of the clocks in this driver seem to
be generic gate and mux implementations that should probably be replaced
with devm_clk_hw_register_gate*() and devm_clk_hw_register_mux*().

I'll look to address the above issues in the next revision.

Thank you,
Drew

[1] https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
[2] https://lore.kernel.org/linux-riscv/20230515054402.27633-1-frank.li@vivo.com/
[3] https://lore.kernel.org/lkml/20240110-clk-th1520-v1-0-8b0682567984@tenstorrent.com/
[4] https://lore.kernel.org/linux-riscv/20240425082138.374445-1-thomas.bonnefille@bootlin.com/

---
Drew Fustini (4):
      dt-bindings: clock: Document T-Head TH1520 AP_SUBSYS controller
      clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks
      riscv: dts: thead: Add TH1520 AP_SUBSYS clock controller
      riscv: dts: thead: Add clock to TH1520 mmc controllers

 .../bindings/clock/thead,th1520-clk-ap.yaml        |   65 ++
 MAINTAINERS                                        |    3 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |   15 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/thead/Kconfig                          |   12 +
 drivers/clk/thead/Makefile                         |    2 +
 drivers/clk/thead/clk-th1520-ap.c                  | 1018 ++++++++++++++++++++
 include/dt-bindings/clock/thead,th1520-clk-ap.h    |   96 ++
 9 files changed, 1210 insertions(+), 3 deletions(-)
---
base-commit: 14396a29c3cfbd42b4ea5cd0a528264831524062
change-id: 20240426-th1520-clk-v2-134bfc9bddb1

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


