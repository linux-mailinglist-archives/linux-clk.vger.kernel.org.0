Return-Path: <linux-clk+bounces-22386-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0275DAC7456
	for <lists+linux-clk@lfdr.de>; Thu, 29 May 2025 01:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F532504B9E
	for <lists+linux-clk@lfdr.de>; Wed, 28 May 2025 23:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572CF1C860C;
	Wed, 28 May 2025 23:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A8DofxYq"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892DB1805B
	for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 23:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748474234; cv=none; b=VP6JlTptNcR+eITLvpJfxMaS5jlLECYr01o0kYkxcJ9SfMPm4mFGBfT+Qg1tSkJ0Jx5KPdukZb1US60mC/vz2ONiNRqh1v+yQ7whvggef2sJVsuQjgQk2+BF4/ds/B4p/8vo6S3CuNR2XvkB9z4b1VMRf+EmnytclPD7z66zcbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748474234; c=relaxed/simple;
	bh=bR4jltbeJghKywDdd3mwBC+Jb3pwT0W7NWcj+YMcNXk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qpbCjdPEG/rPcAhcqQQcY8LnFFxGguUOyjO9pK2DT9rgNndmqYYWZIDQC/Gxe2CHGGIDEXlfn/xS7OMbnMK8nMolNgY4PxyfEGy6dy6ycaqrbSzRGaliFTwMHUIABnALUF4e++xyBNzfMlBVZr9ZBAILuKDJ3Rn5VKCW38bi0Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A8DofxYq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748474231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HNVTS3XJErwAg78tN7yQ7rmq17jTcCsZX0ZsbDsKJ4U=;
	b=A8DofxYqp4AU2Ulq4mM+3J55Z4ZNd/EE2c+kWg2xESfP3GPmSHtuGxI703N23XiaImuvYI
	rjiz3NZsg5J5no5GsQjlSSveCG/Kr67k60uj0C+eqo++Aeup0JGJND90d2kbS8TbQ4Fipx
	m7lMZN0HwHZMFu8moo+tTWuC60clbMA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-bO27Vq7oPE2h_fduLBin3g-1; Wed, 28 May 2025 19:17:10 -0400
X-MC-Unique: bO27Vq7oPE2h_fduLBin3g-1
X-Mimecast-MFC-AGG-ID: bO27Vq7oPE2h_fduLBin3g_1748474229
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c9abdbd3so34258185a.1
        for <linux-clk@vger.kernel.org>; Wed, 28 May 2025 16:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748474229; x=1749079029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNVTS3XJErwAg78tN7yQ7rmq17jTcCsZX0ZsbDsKJ4U=;
        b=hNyAQwTtB3Ue3heX9a3pPDaZzmO8f3BDykFHcEymBq/w5Rv7k53Mv4cnTDSn7LerQ5
         Hew09loKEKIXvDe2TsLmYv+FpeKnFakOhJiJa4/ZSCfS3CDB815pkkI9UonjnzWJj4hd
         VvXLfg3T0pRg6FUhG1Eub/AAmR19NsHPAwa/PGNqCtOrmF6kJ01yJgZqEh7HZVeDOEcI
         DzH2Eyx1ICq7i0cscm5pr3QeQ2Jl21rOfnNgMkbyyQN0G8aif/z9w2P9xsGdjGXHEqe3
         +UPJrtNNpkwoKaYOuCPWcF7MUyaflOP1xAtyWbLtw9EhXEoc0gh5DpbAjXRnmU9PyzWF
         iGsA==
X-Gm-Message-State: AOJu0Yzp5E0EqUsTlEOb5ze48uuM3FBGmHOoi1EkxTr1cB3Y8JB9hoDE
	LJp5NKRCOZRHD9C45ruyErVnFGNK8jyICl3qjFPcMBsrQtO9qjsMhdjDTk4CKDf4vj25LukML8p
	1R8dTQ7tVl5SbINYhk2IHYmyXhQ1UfLINh2xk2M61LNZpX7r6Fmr0cUsobbPiOKn9k4hc6M9e
X-Gm-Gg: ASbGncs9M9IlH4oug7dRpeY6rU6QQQp/OFPDwb30/OquwS7w4LoSjMtmygn8YybvGYD
	HrQsUFIJcMkiEGWvjy9bk49id5+xL9zCSc1Vq8L+RFef7wmfzl/IcfaR34fpEvflskg/l5aK+ZH
	q224rLQiAD5AwXtFtjk9hy77Sz9MIwn/0KEc+98yclEJ0CaW5iCm2DkOz4Nrxt9dwEqZqYT7xTW
	3BBbBenrj/k1su/Haf0D1fyinB5O4GL0zrLII/Cw1tJ47sO9+ZRS5tp4FAZTjUkn75hXjS4w/Yz
	KjW8yflGqY2wruY32zbnUB/2rkiYukOmPWOZGuTGolv9MnFCDg==
X-Received: by 2002:a05:620a:240c:b0:7c5:5670:bd77 with SMTP id af79cd13be357-7ceecbf9d5amr2976783785a.55.1748474229139;
        Wed, 28 May 2025 16:17:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4WUSbtjPX/jIstfDumz1aLRt9cGSRxDbR99fys/EUj2js8Z5XB/6olHr1Rng/KTgyDsa68w==
X-Received: by 2002:a05:620a:240c:b0:7c5:5670:bd77 with SMTP id af79cd13be357-7ceecbf9d5amr2976780085a.55.1748474228734;
        Wed, 28 May 2025 16:17:08 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f984fsm13437985a.43.2025.05.28.16.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 16:17:07 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 00/10] clk: add kunit tests and correct rate change bug
 in the clk core
Date: Wed, 28 May 2025 19:16:46 -0400
Message-Id: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+ZN2gC/0XMSw7CIBSF4a00d+xteIjFjtyHcUDprRAFGmiqp
 uneJU48s29w/g0KZU8F+maDTKsvPsUKcWjAOhPvhH6sBsGEYkpotM8HvvyMq0DNZZ0ZOFNnqIc
 50+Tfv9j1Vj3lFHBxmcw/cWQdl1wo3XbsJDVyHIIpkT6XTKMzS2tTgH3/AugWmcKYAAAA
X-Change-ID: 20250528-clk-wip-v2-813333ab1059
To: Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Alberto Ruiz <aruiz@redhat.com>, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748474226; l=3436;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=bR4jltbeJghKywDdd3mwBC+Jb3pwT0W7NWcj+YMcNXk=;
 b=vdHEnQ94JPNGIHCCZwIxPNiqKHhH6hU6UBtXvT+6qDsaUjVFbtUotmD0843bAl6A5j94b0cD2
 V0X/h9bsyrOBeVqo7JNvcfsOHL5jhB5mtUTiyp9CT9/h6eJXjl/7b81
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

Here's a series that adds various kunit tests to the clk framework,
documents the members of struct clk_core, and adds a fix that does a
better job of preserving the original clock rate when a sibling clock
changes it's rate, and the shared parent's rate.

These tests are centered around inconsistencies and limitations in the
clock framework that may lead to some clocks unknowingly changing rates
during a rate change of their siblings.

The intent of the clock framework is to keep the siblings clock rate
stable during such an operation:

    clk_set_rate(clk, MY_NEW_RATE);

However, it assumes that the sibling can generate that rate in the first
place. In many situations, it can't, and it leads to numerous bugs and
solutions over the years.

https://lore.kernel.org/lkml/20230825-pll-mipi_keep_rate-v1-0-35bc43570730@oltmanns.dev/
https://lore.kernel.org/linux-kernel/20230807-pll-mipi_set_rate_parent-v6-0-f173239a4b59@oltmanns.dev/
https://lore.kernel.org/all/20241114065759.3341908-1-victor.liu@nxp.com/
https://lore.kernel.org/linux-clk/20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com/

We intend to fix these issues, but first we need to agree and document
what these shortcomings are. These patches are meant to do that, even
though some will be skipped as they are currently broken.

Special thanks to Maxime Ripard for the guidance and feedback on this
project so far.

Changes in v2:
- Combine my two v1 patch series referenced below into one.
- Patch 1: Newly introduced: clk: add kernel docs for struct clk_core
- Patch 2: Simplfy further and there is no need to call clk_recalc() for
  parts of the tree that didn't request a rate change.
- Patch 5:
  - Enable all of the tests since this particular limitation is
    addressed in the clk core with patch 2.
  - Update the div_div_3 test to ensure the dividers on the clock
    are automatically updated as expected.
- Patch 7: Correct test description of
  clk_rate_change_sibling_test_suite.
- Links to v1:
  clk: preserve original rate when a sibling clk changes it's rate
  https://lore.kernel.org/lkml/20250520192846.9614-1-bmasney@redhat.com/

  v1: clk: test: add tests for inconsistencies and limitations in the framework
  https://lore.kernel.org/lkml/20250407131258.70638-1-bmasney@redhat.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (10):
      clk: add kernel docs for struct clk_core
      clk: preserve original rate when a sibling clk changes it's rate
      clk: test: introduce a few specific rate constants for mock testing
      clk: test: introduce clk_dummy_div for a mock divider
      clk: test: introduce test suite for sibling rate changes on a divider
      clk: test: introduce clk_dummy_gate for a mock gate
      clk: test: introduce test suite for sibling rate changes on a gate
      clk: test: introduce helper to create a mock mux
      clk: test: introduce test variation for sibling rate changes on a mux
      clk: test: introduce test variation for sibling rate changes on a gate/mux

 drivers/clk/clk.c      |  57 ++++-
 drivers/clk/clk_test.c | 605 ++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 573 insertions(+), 89 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250528-clk-wip-v2-813333ab1059

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


