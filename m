Return-Path: <linux-clk+bounces-32981-lists+linux-clk=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-clk@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ07IQGlb2lIDwAAu9opvQ
	(envelope-from <linux-clk+bounces-32981-lists+linux-clk=lfdr.de@vger.kernel.org>)
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 16:53:37 +0100
X-Original-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5C546CBB
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 16:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5E8B698B4A5
	for <lists+linux-clk@lfdr.de>; Tue, 20 Jan 2026 14:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 000CF44E02E;
	Tue, 20 Jan 2026 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDfmMSph"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004643CEF8
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920288; cv=none; b=H9njmg/nlgQO9ZLxLFAvcnOXhfsj6pk0f1YbmaSmA4BAGkP5jSaifVPklrReKJ5f5ILtP1w2SkDj7EpIFpUvx+MnVWgH1qZeGydJh5xmctSwVFVtvi92hOagdifjV5Dq3T8+F0k2dAScvKhaqk63p0unVILb9QIBlOzT+UVYHTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920288; c=relaxed/simple;
	bh=M526PbpcNO4vmaQq8MPe6vQxFSn4weZJ2HuHxLtPUUQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LnwfiB9O5jKodsPVHFzdgXR/nmfj5jFOML9Tdc+jMpG5JTF8IHjv4dwMXqVtLlzTsdBCv64v8SNKfZDUlVs6bvHc4Nyl701jxB8MH1HDja3TFfU0khJ8+q56n0UU/FpZ9kMT2PMr2cw4dD8SvKZ1uy00RLUoHLw4yNXJoDl3BdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDfmMSph; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29f2676bb21so54939195ad.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 06:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768920286; x=1769525086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yBbL2689+Q4g+pczGHthfRPw4+vnyNvU6Kl1FAL+E3g=;
        b=LDfmMSph5CbpOLkhLRZMsj03UpVLjet6ULEHmuuRsVrhNIh0caWG6fRjhVOYGYERIc
         HsRZUhDze9vfurcke4m6Uh4VSnHhY/+Vb2/+ws/uuNSsWoX+2172gyvnK85ZNec9LfBO
         DQMKj6ATiXccuxYi2mcuw6AuqS635wECPJj9GWWGUZmEFL3SXqsr7Gy10p/IvPd86y6d
         +D5Vt2qbTtgMmixhBMynhDpFo5wfHE09S9ceIGmRe6Bzq4xL4FntJRCZJ+BOYkMu3+9n
         PYVp50Kjay53W9VLYH2CYfopBdOps6vclGxqYsVUrbw/olIUjyLqXNF5pzFDrmieSMEt
         7ErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768920286; x=1769525086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBbL2689+Q4g+pczGHthfRPw4+vnyNvU6Kl1FAL+E3g=;
        b=XlAMRxnVcpGq96WcjT+ueeXPE7U2v+BQQFBvRewgnJwZCu/Br2Oael2RpyV69jdoWZ
         94tIfQNrNRWhCa4yEBmk5DRdQ4i1Tf83AKpOWM9+UF/Ykq8H2FZgsuWXQeT+Vp2U5y6+
         XY6VCdrfZF64dgVOqGiMd5IhBFx82MSao8IvoNlCKLw9ahLTnwctJtiFsGZ2rg1ZLBh7
         g2RFi5oYlUMgyw/hVJpw4y7Tynt50ojNQ1QnuLibNKpqeMxDKA4chMXuvZFbWfa9M9rv
         gWMwnfZorveWyACW9lFAt4YESPFcBeBxMw4+7bp/H0Z+6zyzwCOcRrTJYLqKCU24ABnG
         AMjA==
X-Gm-Message-State: AOJu0YwHR96nsgkl26xKGoWmKsH75NRPSQMpBRajebQeMS+wsqegBYju
	hWfRCtfcnyfnL3nl3q9TMqmPd4CClSsMMCaA+E/2L5UzDZJUaOtmf0+M
X-Gm-Gg: AZuq6aJgkNhbic5891COzz9nCLWL1cEJ4k7d5eoNQNcsHdxLzjk6huAXfbd4f/1Ng+i
	eh+6xmSIsgDCJsduJV3Oy8JWfCYOkZognA3zRxCLh8HAg4KMe5uF08trfv0h86/nWKmPl01W1Zg
	9+q6mLQUS5Pmb4BleSJZOQxjiuXTi39w5Lxo222gEj1HQ4Svz1DamVoLcs2fEwh39W+3YFuplKX
	qyfv8VBGc/gvjqomGL2Mx6haP/oGXzXvYw0eotA5ZE9sUOZzKv7Xrwu/FVVv/1arD2cCTlgfDZu
	bz1A2g6FHtP6TgOrXhm6tMF//hN3kUkh83BNVOaJJtX8iyA2ovF/TsGquzUtbE2Zb/X9j2I6tLw
	9EhW6o2WkMtZYGW5ZViv4PnC4X9EWWjWWLqp42QfgwoGO8eC+3h5FeAw6XFUN17RP0g==
X-Received: by 2002:a17:902:d48d:b0:2a0:98a2:3ccf with SMTP id d9443c01a7336-2a7189186b4mr123666175ad.40.1768920285693;
        Tue, 20 Jan 2026 06:44:45 -0800 (PST)
Received: from k.. ([223.74.152.156])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ab96fsm128243035ad.13.2026.01.20.06.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 06:44:45 -0800 (PST)
From: Nadi Ke <kanadenady@gmail.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nadi Ke <kanadenady@gmail.com>
Subject: [PATCH v1 0/2] clk: sprd: Add support for Unisoc SC9832E clocks
Date: Tue, 20 Jan 2026 22:44:34 +0800
Message-Id: <20260120144436.233998-1-kanadenady@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32981-lists,linux-clk=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linux.alibaba.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[kanadenady@gmail.com,linux-clk@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-clk,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: EE5C546CBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds the clock controller support for the Unisoc SC9832E SoC.
The SC9832E is a quad-core ARM Cortex-A53 SoC from Unisoc (formerly Spreadtrum),
widely used in entry-level smartphones.

This series includes:
 1. The device tree bindings in YAML format and its corresponding IDs.
 2. The clock driver implementation based on the existing sprd common clock framework.

The driver supports the following clock controllers:
 - PMU Gate, PLL, MPLL, DPLL, RPLL
 - AP AHB Gate, AON APB Gate, AP APB Gate
 - AP Clock, AON Clock

Nadi Ke (2):
  dt-bindings: clock: sprd: Add SC9832E clock controller
  clk: sprd: Add SC9832E clock driver

 .../bindings/clock/sprd,sc9832e-clk.yaml      |  129 ++
 drivers/clk/sprd/Kconfig                      |   10 +
 drivers/clk/sprd/Makefile                     |    1 +
 drivers/clk/sprd/sc9832e-clk.c                | 1065 +++++++++++++++++
 include/dt-bindings/clock/sprd,sc9832e-clk.h  |  187 +++
 5 files changed, 1392 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml
 create mode 100644 drivers/clk/sprd/sc9832e-clk.c
 create mode 100644 include/dt-bindings/clock/sprd,sc9832e-clk.h

-- 
2.34.1


