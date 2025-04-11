Return-Path: <linux-clk+bounces-20488-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E20EA85AC6
	for <lists+linux-clk@lfdr.de>; Fri, 11 Apr 2025 13:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C6F31BA5D3A
	for <lists+linux-clk@lfdr.de>; Fri, 11 Apr 2025 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 937C829614B;
	Fri, 11 Apr 2025 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V/nZ8B7W"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E4F27EC9D
	for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 10:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369148; cv=none; b=H3T26OV1xOnUQd7qY5AkIsjC45zRYSqQEWgn1Cb7ulfenV2pZH06LOuMIIpDtBHG3U08JfK304tsdZWo4uK7z7xJZCC/G/Ew+tEhaLBq3k7xCshgdgtxN+dSD0ChXFiBebTgzN1Uwf/ttRDWRIIRLtBKOJ3c+TlBosamvwL1sbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369148; c=relaxed/simple;
	bh=Lz8/dlHquQs8+KgJWlTHfeHGDG+b2IGK2cF/V+dR5o0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ul8yJLgmIivDe/F72MkENtYCDVUnIOwIRF5jVD7NR66V5MTZw+gudGbYqHfBlRgHCpKjmFkifxe0q3BhTG/aGzBnulq00kGo4YpEFoUVsWlMnl0JohFjBXn1dxzCFFYZXVzbuKU8cQNe/rMP4vYpxwXnDqB06BaR+K/Oaq8dQG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V/nZ8B7W; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30828fc17adso261734a91.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 03:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369146; x=1744973946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cw314qO5OzgfErL/PQP5mXU7cjPJv+CNURyMPhNy3E=;
        b=V/nZ8B7Wdwc5yzPo3fPLqG5IOO865KEst1zoHPUXvJ4QQlfc8rjt8umE16XlMn3Mt5
         T9X0uLWMusDiVzg0QekAxOPUQuIcRKz/85VN6iwzKfRxo1+FwNjiy5nAldDtRltkDYoi
         gwFldS1ra6iLBAEyOUAamPAjqyKqCKxGu+NV6eINHAyTCLjYNHXAcyu5n4EfoDDuaW1I
         lqL1WPq6/Ek9Uo66w3uprsx6N5DTIdqN53cNBGNIXQiguIKPJs73ATFTMqmTjlV7oaYd
         jyipxrQUrhbSsI6XAF2X9mArcIksuqUm5TXo6KFVrZiOMyXwXgIwvHtZ/XSe/RA23zAI
         8a6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369146; x=1744973946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/cw314qO5OzgfErL/PQP5mXU7cjPJv+CNURyMPhNy3E=;
        b=WpGruxaEZ79gvBtrrA9+ivaLddtdv3xWF3yNLI7GGK+rDanq3h0DLKAkKu4oaFPW63
         6ZKvguhPbml5FlMJcaxNHnXVDSvng4B3RI1c0xi7W7ZILbPv8RTnTwsZ4DAjC+KQ+gSi
         j5wV8ahOdice886hsNO5m50M0E62s+c/gJ5pQlMZGiAxY7lfwDwUx8A99qqy4x0FfDIc
         GIW1Ku3qe8CZc7mimcxbZST0A/zAeqikIf168JKIh55W6B+9WSZho0iBkbpIWoKClTeX
         M3T3lZMNyuso3CbTbthyI4wta2Qo65DabN7LH0MPUC7TLnx/CHXxJ+n2OsFch4iLSHcD
         Ee8w==
X-Forwarded-Encrypted: i=1; AJvYcCWvXO1PXtKV590g1eTY8eKk4/ykoTbygJxr1pq6x8It08Xp/cnrWDSDn8mRBexZR7e0R08OmXVwgfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx19XgE4YrYWKZoFkq1GeGMb/QYEkfx7bCh9Acc8U9l5xf60aUm
	vw0k9jsoWKyRh3VmvYXWlmAeA+I4th9TMobAvDQMk2MjKAfCG1R15CDyiYQkUs8=
X-Gm-Gg: ASbGncsw4av2PtZHSFifJOM9FomvhdMCCkdeXEbSLy+QiQEbDtSV4WU5+xVCFSr1Nws
	hhmSP+w09uKPptBNW9wRC0t3NxJcYtWzpzTuEYZbjhS0kQmedKFVaMYRi6+WQjg09sblnIy+oiG
	+9yTueOGqhL6SeE4gYMGqTD6+M0PTqJ9ZDo1alf4G5M6EutNeZUj30/FWLvOvNokyDXoBAs2e0W
	9E3D+yOdyhWQ/SDdRo22pQIbEICct4Ekw/D81LMNWY6P5LgHyVmupwu6mMHkiCIRBpvnL2IVqPI
	2KDBuSUggA5kIYB/BYPSni+LD7JDFMwF1HGwoWkSdLOC41R+ohVg
X-Google-Smtp-Source: AGHT+IEFxwHKqoOI4yL6xARYViMgwvtWz0BpJSZrfD87BTkTPcEYvJrbdX8FbmAvDOdGi5eq0VSwyA==
X-Received: by 2002:a17:90b:5744:b0:2fa:1f1b:3db2 with SMTP id 98e67ed59e1d1-308236723c3mr3321753a91.25.1744369146401;
        Fri, 11 Apr 2025 03:59:06 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e79fsm5408297a91.19.2025.04.11.03.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:59:05 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Yury Norov <yury.norov@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 02/17] rust: cpumask: Add few more helpers
Date: Fri, 11 Apr 2025 16:25:01 +0530
Message-Id: <878eb11f74cd320cbb06fb04c8ef655de81dd358.1744366571.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1744366571.git.viresh.kumar@linaro.org>
References: <cover.1744366571.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add few more cpumask helpers that are required by the Rust abstraction.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 rust/helpers/cpumask.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/rust/helpers/cpumask.c b/rust/helpers/cpumask.c
index ae964cddbd41..30fc0bc0c0e8 100644
--- a/rust/helpers/cpumask.c
+++ b/rust/helpers/cpumask.c
@@ -12,11 +12,26 @@ void rust_helper___cpumask_clear_cpu(int cpu, struct cpumask *dstp)
 	__cpumask_clear_cpu(cpu, dstp);
 }
 
+bool rust_helper_cpumask_test_cpu(int cpu, struct cpumask *srcp)
+{
+	return cpumask_test_cpu(cpu, srcp);
+}
+
 void rust_helper_cpumask_setall(struct cpumask *dstp)
 {
 	cpumask_setall(dstp);
 }
 
+bool rust_helper_cpumask_empty(struct cpumask *srcp)
+{
+	return cpumask_empty(srcp);
+}
+
+bool rust_helper_cpumask_full(struct cpumask *srcp)
+{
+	return cpumask_full(srcp);
+}
+
 unsigned int rust_helper_cpumask_weight(struct cpumask *srcp)
 {
 	return cpumask_weight(srcp);
-- 
2.31.1.272.g89b43f80a514


