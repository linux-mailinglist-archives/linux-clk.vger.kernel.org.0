Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D212321C3
	for <lists+linux-clk@lfdr.de>; Wed, 29 Jul 2020 17:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgG2PoI (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 29 Jul 2020 11:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726615AbgG2PoI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jul 2020 11:44:08 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A743C0619D2
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2020 08:44:08 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id f18so22110901wrs.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Jul 2020 08:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tuiwq6PL49LgBLJB2iEw3NbuM/jiIuCvykCzTBqHaAA=;
        b=FS6h71u5nG4XhXmL0xBxzPU4diQE9Q2Zpew4j4jjY4WuGIDjtKoxp0YtFc9dj8HhrN
         QoIgPpKfjk6Soe8qvPm3YZMHmP0SRtiDVUBnoEPPmjbqkI9eaiPuNt/hjt6di05vUfOj
         sCR1Q+Lrnz+hYJ+ACuqXBgwWdmTWTgDb8jShGJDuuAF6oWFDJBEwaPu3N+lSLavKpMJI
         29f8AjvI6+LmYSO7I4uhSysBwYF1Nk/2NZxQBDu1FlJks0amxkSRjc7F3JevXv/D5pXZ
         s4l4bvNHDcNxZI+w6gMwVDs97ktovsnGTXTJNs3L8UEMeLVlKNSVmZrpDZdxnQqHDG74
         pmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Tuiwq6PL49LgBLJB2iEw3NbuM/jiIuCvykCzTBqHaAA=;
        b=diJhIoZFBRRcSc2OE1qFg1PyrExmPB7RzZodfCbjduizb4Lsymf89QmaRC/AL1flkK
         HK+ChjMdQ9MnTOJgIexRXSVTsPbDK7jE4MuvTDjAoYD32Y9D2wRp0sqvYGn6AnqQLbtG
         yyglnoSUq6y3lQ+bekebZBr0c21Xcsn5LzoJxREtp1HUa8X6Yp9QaBq9prgLBUJhbpyI
         JOU/mGTAmgTwb9sH+Hjy9cNv+YN/LqiX6CeAJMVlqmxXBJV3Fsz27lPG7XRMAnmxr6Bm
         zm6c09/rXxAhIpKPOKLuggQ9XfrhXWbpSh0FgL8R5KaWoDfoNckpaTPwaeUF22BSjYCN
         tyRA==
X-Gm-Message-State: AOAM533YfopRzdCIQTCntmHOajq6URheOn96QP4Y90rYcD4AGuIDq6yr
        ytFXek+6HLK5AkdQIMjmXt9l3A==
X-Google-Smtp-Source: ABdhPJyTMeEr287ehDzeTN6mcV+wNZneeb9TvFO04zB+QZ6QobJZHTZKK3fS+lbNnvjc9AqXgsXxZw==
X-Received: by 2002:adf:ea4f:: with SMTP id j15mr30067384wrn.253.1596037446658;
        Wed, 29 Jul 2020 08:44:06 -0700 (PDT)
Received: from starbuck.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a134sm6526030wmd.17.2020.07.29.08.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 08:44:06 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: meson: axg-audio: fix tdmout sclk inverter
Date:   Wed, 29 Jul 2020 17:43:56 +0200
Message-Id: <20200729154359.1983085-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The patchset fixes a problem with TDMOUT sclk inverter found on the
g12a and following SoCs.

On the the axg, a single bit was enough to drive the inverter. On
the g12a a bit was added to, somehow, change how the clock is sampled.
For the inverter to behave as intended, the new bit should be the
inverse of the inverter bit at all time.

Quite a lot of lines for a single bit ...

Jerome Brunet (3):
  clk: meson: add sclk-ws driver
  clk: meson: axg-audio: separate axg and g12a regmap tables
  clk: meson: axg-audio: fix g12a tdmout sclk inverter

 drivers/clk/meson/axg-audio.c | 214 +++++++++++++++++++++++++++++-----
 drivers/clk/meson/clk-phase.c |  56 +++++++++
 drivers/clk/meson/clk-phase.h |   6 +
 3 files changed, 246 insertions(+), 30 deletions(-)

-- 
2.25.4

