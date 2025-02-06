Return-Path: <linux-clk+bounces-17719-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D8CA2A460
	for <lists+linux-clk@lfdr.de>; Thu,  6 Feb 2025 10:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 018CF18890D5
	for <lists+linux-clk@lfdr.de>; Thu,  6 Feb 2025 09:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD37522756E;
	Thu,  6 Feb 2025 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rswwmq7Z"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94ADC226884
	for <linux-clk@vger.kernel.org>; Thu,  6 Feb 2025 09:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738834136; cv=none; b=P583XFpJc+B6wsiHB7MIBUzPgT41P2NFjquXcsY/0Y317PyZ7Q31aA8crPNfKOvgyXCGDkHk8pBBGrVxdOgFLj0ex4UGySZM4NaV9S9KquqhPHKWJwIdJ2PxfupT9D4xHokVZdmNYEE55uIyXo2+FspLqMaX1RARDdhWW7LTFAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738834136; c=relaxed/simple;
	bh=xydhrXNwbR6b23NtRkGsxwSBfZgDAxPgbGHs9xWaEVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SfnK4ba2KutDx4HbrlbAn4P3zts9bkjqVUrdOjnI63Ba/twWUOL3gW7UfzE2ue2uJhH7QBC6UsH7xfT4ag1FgTurEjWVgXCAZjC57hVtqW+4e7+6L3ZYw8phUonE/rGQyRY4UnWZKAugyByjejYRce/NCJloFQM8B3QHfAxl3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rswwmq7Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2165cb60719so12799445ad.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Feb 2025 01:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738834134; x=1739438934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UNiJjfxZrKVMTDCAqOVZp5Rhiszwav3OEDmf8+LxyHc=;
        b=rswwmq7ZtRgBqKUefbHZsTxz7jwgOu5gX9d1gqhFCRJZrwSsEXhLzFvZgqudNYnHz8
         s1UU1Z/novLDMCEzb4c+5pbZlke6Nb/nduYlg+ualueTSbhj9Ji2wrr+7cjkkbPEemM7
         aRHQZONl+rolk/jSL4EjCUcsG17IWnx/GacWZIGxbhF7Jr+UtCfS6PYI4VIVUQLihfSa
         e+wEkYhlEMiWPydrug1/xGe87IgZ3jNjj2lB7qpnInJ1vpmZcQKc2zNu/C3hnG4uYJ/w
         UHkKYZQfvZO5qCywWZ8MMF6dbZB/wcMuVcSUjIE83u2x2wnrzq7smv1bxK5jU0DZEAJ0
         woGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738834134; x=1739438934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UNiJjfxZrKVMTDCAqOVZp5Rhiszwav3OEDmf8+LxyHc=;
        b=EJaTD+gjb2lcCoULvUQnqDg7tUGZ/hmV+51WCjUrvGY2CAdT8dqyoCg0ne2vwRnnyA
         i9y1qjqQ1gw15/ZkrSTZz8mJ5ig2BNxYmuU4Iqr7Lyw0bWzAe4PA0WoAUfYsVNnG9c1B
         JiZsdss+1tO0A2THL6dEN/s6Guu6HEnJO5VToNxA57hw7kUM0icWC6t/69YnaB1upjuX
         XFojBhTy2TgvmT/LTYE/oegUvzAIbiOgXTsh6bdayqNxfwRTRe5OEvPdVqxQo99PW6/o
         mmvl/uAPKaG+vkKvW3MPF36zT9uT26LV/h+VO7cBeWgXfM9stZ729HGgPIdYJoYjDp4H
         C2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdteo0shneBgVqOdifnhSZN2xHiRpNw7Vo3Vmu1RwDVv4NulzSyWD9dBajluh48yDcGwj2Pac2fj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHBHmMPzcY0fgJeJvYogcKKy78IhedapIP/GSCPT8KVBwh7JWy
	IAztm1xexqCxCtPcxfbZAnolIcUjz0S4YHbfKcJwz5swwSjeqsyLKuejNZG+KzA=
X-Gm-Gg: ASbGncvuyjzs/raxtzP9GF0EI2xHzjOSvk60ppzwCgFwY0KBx5tZhvwhdeMsZLawpJ6
	UXVQ1gpG8dNAWRbokrJMd2oWc36dIHXr7SfSCVmbH4yRbaQH9Co64N0KM6ACxedE7sBIrFcjR28
	HODBPSeyAAMgeKqxQONwsp9L5rVMo3OXyXUN62b4Aw1GQUfpJQgQT31LWj/Rdg7A8jTW/sumUOF
	zBBShtk6tFqWFTakOMNeuqmITPOr7D4pMKQszNofp1PZUMUF0saX9idlp9fXNHEj+Mno184JfpO
	xF1T3mqcxeAGVk5VtQ==
X-Google-Smtp-Source: AGHT+IGnSqJQjNRy6mCYk0/OJtqZQdpZtORA2QNISIKIb5NfeUD1BwRd+d4p1y7xF51rpRHpqEukhQ==
X-Received: by 2002:a17:903:190:b0:21f:3a7b:f4f1 with SMTP id d9443c01a7336-21f3a7bf8d0mr19186405ad.32.1738834133861;
        Thu, 06 Feb 2025 01:28:53 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09b3ee47sm871574a91.39.2025.02.06.01.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 01:28:53 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Trevor Gross <tmgross@umich.edu>,
	Viresh Kumar <vireshk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yury Norov <yury.norov@gmail.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Anisse Astier <anisse@astier.eu>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V8 00/14] Rust bindings for cpufreq and OPP core + sample driver
Date: Thu,  6 Feb 2025 14:58:21 +0530
Message-Id: <cover.1738832118.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I am seeking a few Acks for this patch series before merging it into the PM tree
for the 6.15 merge window, unless there are any objections.

This series introduces initial Rust bindings for two subsystems: cpufreq and
Operating Performance Points (OPP). The bindings cover most of the interfaces
exposed by these subsystems. It also includes minimal bindings for the clk and
cpumask frameworks, which are required by the cpufreq bindings.

Additionally, a sample cpufreq driver, rcpufreq-dt, is included. This is a
duplicate of the existing cpufreq-dt driver, which is a platform-agnostic,
device-tree-based driver commonly used on ARM platforms.

The implementation has been tested using QEMU, ensuring that frequency
transitions, various configurations, and driver binding/unbinding work as
expected. However, performance measurements have not been conducted yet.

For those interested in testing these patches, they can be found at:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git rust/cpufreq-dt

This version is rebased on v6.14-rc1.

--
Viresh

V7->V8:
- Updated cpumask bindings to work with !CONFIG_CPUMASK_OFFSTACK case.
- Dropped few patches (property_present() and opp helpers), as they are already
  merged.
- from_cpu() is marked unsafe.
- Included a patch by Anisse Astier, to solve a long standing issue with this
  series.
- Dropped: "DO-NOT_MERGE: cpufreq: Rename cpufreq-dt platdev."
- Updated MAINTAINERS for new files.
- Other minor changes / cleanups.

V6->V7:
- from_cpu() is moved to cpu.rs and doesn't return ARef anymore, but just a
  reference.
- Dropped cpufreq_table_len() and related validation in cpufreq core.
- Solved the issue with BIT() macro differently, using an enum now.
- Few patches are broken into smaller / independent patches.
- Improved Commit logs and SAFETY comments at few places.
- Removed print message from cpufreq driver.
- Rebased over linux-next/master.
- Few other minor changes.

V5->V6:
- Rebase over latest rust/dev branch, which changed few interfaces that the
  patches were using.
- Included all other patches, which weren't included until now to focus only on
  core APIs.
- Other minor cleanups, additions.

V4->V5:
- Rename Registration::register() as new().
- Provide a new API: Registration::new_foreign_owned() and use it for
  rcpufreq_dt driver.
- Update MAINTAINERS file.

V3->V4:
- Fix bugs with freeing of OPP structure. Dropped the Drop routine and fixed
  reference counting.
- Registration object of the cpufreq core is modified a bit to remove the
  registered field, and few other cleanups.
- Use Devres for instead of platform data.
- Improve SAFETY comments.

V2->V3:
- Rebased on latest rust-device changes, which removed `Data` and so few changes
  were required to make it work.
- use srctree links (Alice Ryhl).
- Various changes the OPP creation APIs, new APIs: from_raw_opp() and
  from_raw_opp_owned() (Alice Ryhl).
- Inline as_raw() helpers (Alice Ryhl).
- Add new interface (`OPP::Token`) for dynamically created OPPs.
- Add Reviewed-by tag from Manos.
- Modified/simplified cpufreq registration structure / method a bit.

V1->V2:
- Create and use separate bindings for OF, clk, cpumask, etc (not included in
  this patchset but pushed to the above branch). This helped removing direct
  calls from the driver.
- Fix wrong usage of Pinning + Vec.
- Use Token for OPP Config.
- Use Opaque, transparent and Aref for few structures.
- Broken down into smaller patches to make it easy for reviewers.
- Based over staging/rust-device.

Thanks.

Anisse Astier (1):
  rust: macros: enable use of hyphens in module names

Viresh Kumar (13):
  cpufreq: Use enum for cpufreq flags that use BIT()
  rust: cpu: Add from_cpu()
  rust: Add cpumask helpers
  rust: Add bindings for cpumask
  rust: Add bare minimal bindings for clk framework
  rust: Add initial bindings for OPP framework
  rust: Extend OPP bindings for the OPP table
  rust: Extend OPP bindings for the configuration options
  rust: Add initial bindings for cpufreq framework
  rust: Extend cpufreq bindings for policy and driver ops
  rust: Extend cpufreq bindings for driver registration
  rust: Extend OPP bindings with CPU frequency table
  cpufreq: Add Rust based cpufreq-dt driver

 MAINTAINERS                     |    6 +
 drivers/cpufreq/Kconfig         |   12 +
 drivers/cpufreq/Makefile        |    1 +
 drivers/cpufreq/rcpufreq_dt.rs  |  238 +++++++
 include/linux/cpufreq.h         |   96 +--
 rust/bindings/bindings_helper.h |    5 +
 rust/helpers/cpufreq.c          |   10 +
 rust/helpers/cpumask.c          |   40 ++
 rust/helpers/helpers.c          |    2 +
 rust/kernel/clk.rs              |   48 ++
 rust/kernel/cpu.rs              |   31 +
 rust/kernel/cpufreq.rs          | 1054 +++++++++++++++++++++++++++++++
 rust/kernel/cpumask.rs          |  138 ++++
 rust/kernel/lib.rs              |    8 +
 rust/kernel/opp.rs              |  889 ++++++++++++++++++++++++++
 rust/macros/module.rs           |   17 +-
 16 files changed, 2543 insertions(+), 52 deletions(-)
 create mode 100644 drivers/cpufreq/rcpufreq_dt.rs
 create mode 100644 rust/helpers/cpufreq.c
 create mode 100644 rust/helpers/cpumask.c
 create mode 100644 rust/kernel/clk.rs
 create mode 100644 rust/kernel/cpu.rs
 create mode 100644 rust/kernel/cpufreq.rs
 create mode 100644 rust/kernel/cpumask.rs
 create mode 100644 rust/kernel/opp.rs

-- 
2.31.1.272.g89b43f80a514


