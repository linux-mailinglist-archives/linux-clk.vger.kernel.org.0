Return-Path: <linux-clk+bounces-552-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAE77F777B
	for <lists+linux-clk@lfdr.de>; Fri, 24 Nov 2023 16:19:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D05FF1C20E19
	for <lists+linux-clk@lfdr.de>; Fri, 24 Nov 2023 15:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EDC2E82E;
	Fri, 24 Nov 2023 15:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUdHFR8P"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1E5DC1;
	Fri, 24 Nov 2023 07:18:57 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-332ed1bd4cbso189529f8f.2;
        Fri, 24 Nov 2023 07:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700839136; x=1701443936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nc0B9c34z241FEQKtC8nWY35TPMki5fFxXhhehIVoNA=;
        b=UUdHFR8PKFhJCTZ0UzmLv+dtsB5ABNqHN/r1+qxCvJbMHeY1O737Hm606iRQGOxqmT
         /avDGvXQQNQBoUmrsgsdzabTT3Hlx2PG6vtjE9ySjoSpSdgOLOFojgfygThQ+QXTi0Nf
         iwq5HbZG8lzuVt3xHYMFyvDq3FoyCNPqH1qIkkoGSF4PojON1/bp+dHhQ2N6CARkx/g/
         XsY7k/Sv/6q4Lo6OykgAfTxoBFuhJaOZ7y2Pu2EN1tP0x/9sxPMdRrCxvyCm2h4WoZwm
         qWMGdY6QqNk025taTcvUEz2nPIjoewRXMP2VWVPZZe2RA1JBSdLeEvxEnZDmHbe4BW04
         ULtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700839136; x=1701443936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nc0B9c34z241FEQKtC8nWY35TPMki5fFxXhhehIVoNA=;
        b=fPnCgKugmtezVnHqV5zhDT/sWvnLKpNOejvXOdJXDnEXYXFtpuziKp7hoUVSe39IIM
         7XAJsD0M9fs/eAB8wdZIGpNHDgQKnboPGyU8QVz5OTkDfWkgMd0m9ZjFCz1Gdz3/OsvF
         z/UHyabyJsS0aqWADysQrj+vbQlx/QDmfRZ/M5bQO2pOxL0Y8F5MsJqER6T5B9QgELfO
         W0GZUDeR91c+IiBwB/GLEwUgCPYT8pNhbiXimvcGWr5QKmqDgCOYonxO7uSkavS77M4O
         4tRWaaaHLLY410GB7n2VRzo+7OtNspBPgJ4BYj3dKWqw6Wk/KN2/jcsG1annBKcXebNl
         /KEA==
X-Gm-Message-State: AOJu0Yxt9cszfZ+NhJqbj+bPnyq+E1xOxtCMBGWwwszt4rIYiXUiylg6
	lcaQof9rbZTi5JtX2hmR0ak=
X-Google-Smtp-Source: AGHT+IHWjV6p1i5kXyAASNDrZStBIwjJK7//qf9ptZT7vV4NEBlB4tmGL5p3BHuaiD1Ye5hG8Xyq8g==
X-Received: by 2002:adf:e4c4:0:b0:331:7793:42fb with SMTP id v4-20020adfe4c4000000b00331779342fbmr2465493wrm.61.1700839136121;
        Fri, 24 Nov 2023 07:18:56 -0800 (PST)
Received: from localhost.localdomain ([78.209.42.235])
        by smtp.googlemail.com with ESMTPSA id x12-20020adff64c000000b0032dcb08bf94sm4513699wrp.60.2023.11.24.07.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 07:18:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v7 0/3] clk: qcom: clk-rcg2: introduce support for multiple conf for same freq
Date: Fri, 24 Nov 2023 16:18:44 +0100
Message-Id: <20231124151847.1915-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series fix a current problem with ipq8074 where the 2 uniphy
port doesn't work in some corner case with some clk configuration. The
port to correctly work require a specific frequency, using the wrong one
results in the port not transmitting data.

With the current code with a requested freq of 125MHz, the frequency is
set to 105MHz. This is caused by the fact that there are 2 different
configuration to set 125MHz and it's always selected the first one that
results in 105MHz.

In the original QSDK code, the frequency configuration selection is
different and the CEIL FLOOR logic is not present. Instead it's used a
BEST approach where the frequency table is checked and then it's checked
if there are duplicate entry.

This proposed implementation is more specific and introduce an entire new
set of ops and a specific freq table to support this special configuration.

A union is introduced in rcg2 struct to not duplicate the struct.
A new set of ops clk_rcg2_fm_ops are introduced to support this new kind
of frequency table.

Changes v7:
- Improve handling of exit condition on missing parent.
Changes v6:
- Small rework of best_conf selection to mute Sparse warn.
Changes v5:
- Rework selection logic with suggestion from Konrad
- Return -EINVAL and WARN if we fail to find a correct conf
Changes v4:
- Drop suggested but wrong re-search patch
- Move everything to separate ops and struct to not affect current rcg2
  users.
Changes v3:
- Add qcom_find_freq_exact
- Drop re-search on rcg2_set_rate
- Rework multiple conf patch to follow new implementation
Changes v2:
- Out of RFC
- Fix compile warning from buildbot related to F redefinition

Christian Marangi (3):
  clk: qcom: clk-rcg: introduce support for multiple conf for same freq
  clk: qcom: clk-rcg2: add support for rcg2 freq multi ops
  clk: qcom: gcc-ipq8074: rework nss_port5/6 clock to multiple conf

 drivers/clk/qcom/clk-rcg.h     |  24 ++++-
 drivers/clk/qcom/clk-rcg2.c    | 166 +++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.c      |  18 ++++
 drivers/clk/qcom/common.h      |   2 +
 drivers/clk/qcom/gcc-ipq8074.c | 120 +++++++++++++++---------
 5 files changed, 285 insertions(+), 45 deletions(-)

-- 
2.40.1


