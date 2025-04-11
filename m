Return-Path: <linux-clk+bounces-20486-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A4CA85AC5
	for <lists+linux-clk@lfdr.de>; Fri, 11 Apr 2025 13:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D8A5442718
	for <lists+linux-clk@lfdr.de>; Fri, 11 Apr 2025 10:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A9C238C20;
	Fri, 11 Apr 2025 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVihUGyP"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8042A238C0B
	for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369143; cv=none; b=Ct1Z12HdrmNH8owcJ0mMyfZmxFAk+J49PTJVBmcZ/EIc8svW/OEI2JoP2t94dg7bn8aV5iCExjJtyMp3NnO7Sa3saesojHn20fobkxstj0xzwN/+us7HVKDirJVLV8c0IvZDSMEPR77x1sqC7+xHvdVlaLou/3YmQhBcYT50aDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369143; c=relaxed/simple;
	bh=iXxif58jOKd68UuNb1nH/Aphfy+h+IDwjXQAeloxi0s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dlTnFo6zFh8fXOuFvz7E3KO+p/CwKIVF9oNN0bUjE9LtIgFM17OQlKlBCCqRKZUAedilu5dlajgnoNCrV8Ci8xlx9JFIqTioi7cTwtajiBxKbsOyLgSGDt7X1RjGQ8q4Bdo3zZLJ6y9ech9GOh+iSKIYlk+sFG/dXxm8Xb2Zd/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVihUGyP; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af50f56b862so1325303a12.1
        for <linux-clk@vger.kernel.org>; Fri, 11 Apr 2025 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744369140; x=1744973940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uep56qqpHOxiVc7zmrD76SN7umWcmEL5ASRqQX2jJpY=;
        b=rVihUGyPdrA6gWKBVgcMau7rjSawN8kn5IJpCRrDaZUSYvSFmqpolCK8ONKxWdWzS3
         w+lnAmqWWUKAidg+ODSpCPDV+txc6V5pJM0kVwrqdH8l8NvcQIrGxmXAXYJ65my/gKKa
         WgH/HWCt1zThJe1kj5IRJ4LmCAUmaVyLDBGBbQzUqVlOLTfWadX8I6v8mjUakVXKwwEj
         zRjLMs0kiGNZMQRnSoA2Un9QI0AX5BTUKlSX3/7h8II8CuTfb669wgun7tpE5o4pTSeL
         PNhhTTZzwiDuH8XXKmbbPGcTZsDs+3AXHpZXaADQNoJFdk3jerTCTqsrZJ1ZA76g+pAi
         Ymdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744369140; x=1744973940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uep56qqpHOxiVc7zmrD76SN7umWcmEL5ASRqQX2jJpY=;
        b=c/Yu2usCudQp30A22szNqHfFqs8YUFGrpkmVszp3ZFkjpIR3CXsp72O8e9BkG+t+b6
         +YsdWyhuWmE8M8U79/N1sZM7a3NIUoTEHvPuKsU9/gfAN6iPPMyuuaS/oaKgqMk9txfd
         zFEQkGTtbzS4Gg+D0k8rZ8CH9llcqeSD7AvX3WHD8CUQRSwdgsxGMGg5CRE5rmm2aSsE
         lw81LxenbGQb/kIlpuqZ4eUrKo8tMAwHmTzS/N+NEVnVx5kM1GeguxUezmEChyuI6WGa
         ioe0Mv4hvTpKTydTnKSLd2AWrJjDjT19muwyPiWJVNVD+AA8KrrP48fgjstwN+Z+TKQg
         jlcw==
X-Forwarded-Encrypted: i=1; AJvYcCXzCHm6lzooWw9aN6/VnDqM24V7KKAwOSdNJedKU1eruCTNAlMoIM2UfHFdNBFp9aUjJ+GKx9J1Q4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNpa7I8mP90XulrjVOz1hdVPg2X6gKjSVte1hlgXNS+37fEgh8
	/6XUEjMkX3MR2TGZ6YJUGuqLbrIZtHb97Sac7Zqi+M+IDOpBLEyEamdV9F2b2k8=
X-Gm-Gg: ASbGncufeEDIX3ML9COLf4AxQjO6N7UkVXQ0ahhTqU8+fHXq3BOiwwnqylLgN0mqOSq
	qQgG5PnOChAya5X8789/dLr/DAu7pSaTXkWb2bTlOo+85C8MAOAdXdg/ndVm7nRYZzuEbpERmzx
	mDX0Gj8yAJ7DX6kvhwkRMkd86hsmJ15Yaw7zvo+xOtvuwAGICn95UiOjIAIoVyknMS05pa0P/nr
	bucKKbNE3VNH0jcI++rWXvrQh6EM4ixdDKKqFUfhwQwLzyZf4xAF9Nwqdcrei4T2tVnpy8FHNrc
	UFkKtY1YtLB2fq7M5BjpjG7sXKWCzeMDwhfDIVS5kQ==
X-Google-Smtp-Source: AGHT+IEHJEE1W6bkCyi36vC/D7igePx9OaO80JYKfuHw3vOda2wbiFANJs+ZIss/8NG3B9oBQ4vOCg==
X-Received: by 2002:a17:903:2345:b0:224:2384:5b40 with SMTP id d9443c01a7336-22bea4c3b41mr42138095ad.24.1744369139678;
        Fri, 11 Apr 2025 03:58:59 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c6b3sm46168835ad.77.2025.04.11.03.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 03:58:59 -0700 (PDT)
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
	Danilo Krummrich <dakr@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Peter Zijlstra <peterz@infradead.org>,
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
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Anisse Astier <anisse@astier.eu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V9 00/17] Rust abstractions for clk, cpumask, cpufreq, OPP
Date: Fri, 11 Apr 2025 16:24:59 +0530
Message-Id: <cover.1744366571.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series introduces initial Rust abstractions for a few subsystems: clk,
cpumask, cpufreq and Operating Performance Points (OPP).

After the previous version (V8) was posted, patches for clk and cpumask
abstractions were sent separately for thorough review. Now that most of the
reviews are done for them, I am sending them with client code (cpufreq/opp)
again. Yury also suggested the same earlier.

The abstractions cover most of the interfaces exposed by cpufreq and OPP
subsystems. It also includes minimal abstractions for the clk and cpumask
frameworks, which are required by the cpufreq / OPP abstractions.

Additionally, a sample `rcpufreq-dt` driver is included. This is a
duplicate of the existing `cpufreq-dt` driver, which is a
platform-agnostic, device-tree based cpufreq driver commonly used on ARM
platforms.

The implementation has been tested using QEMU, ensuring that frequency
transitions, various configurations, and driver binding/unbinding work as
expected. However, performance measurements have not been conducted yet.

For those interested in testing these patches, they can be found at:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git rust/cpufreq-dt

Based on 6.15-rc1.

V8->V9:
- clk (changes since V4):
  - V4: https://lore.kernel.org/all/cover.1742276963.git.viresh.kumar@linaro.org/
  - Add more methods in Hertz (as_khz/mhz/ghz).
  - Reword a comment.

- cpumask (changes since V4):
  - V4: https://lore.kernel.org/all/cover.1743572195.git.viresh.kumar@linaro.org/
  - Add support for cpumask_{test_cpu|empty|full} and switch to using non-atomic
    helpers for set/clear.
  - s/CpumaskBox/CpumaskVar/
  - s/set_all/setall/
  - Improved examples, comments and commit logs.

- cpufreq/opp:
  - V8: https://lore.kernel.org/all/cover.1738832118.git.viresh.kumar@linaro.org/
  - Based on review comments received for clk/cpumask, a lot of changes were
    made to cpufreq/opp bindings in code, comments, examples, etc..
  - `attr` fields were dropped from cpufreq support, not required anymore
    because of latest changes in cpufreq core.
  - Use Hertz/MicroVolt/MicroWatt as units.
  - Lots of other cleanups.
  - Dropped Reviewed-by from Manos (there were too many changes).

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

--
Viresh

Anisse Astier (1):
  rust: macros: enable use of hyphens in module names

Viresh Kumar (16):
  rust: cpumask: Use non-atomic helpers
  rust: cpumask: Add few more helpers
  rust: cpumask: Add initial abstractions
  MAINTAINERS: Add entry for Rust cpumask API
  rust: clk: Add helpers for Rust code
  rust: clk: Add initial abstractions
  cpufreq: Use enum for cpufreq flags that use BIT()
  rust: cpu: Add from_cpu()
  rust: opp: Add initial abstractions for OPP framework
  rust: opp: Add abstractions for the OPP table
  rust: opp: Add abstractions for the configuration options
  rust: cpufreq: Add initial abstractions for cpufreq framework
  rust: cpufreq: Extend abstractions for policy and driver ops
  rust: cpufreq: Extend abstractions for driver registration
  rust: opp: Extend OPP abstractions with cpufreq support
  cpufreq: Add Rust-based cpufreq-dt driver

 MAINTAINERS                     |   11 +
 drivers/cpufreq/Kconfig         |   12 +
 drivers/cpufreq/Makefile        |    1 +
 drivers/cpufreq/rcpufreq_dt.rs  |  236 ++++++
 include/linux/cpufreq.h         |   96 +--
 rust/bindings/bindings_helper.h |    4 +
 rust/helpers/clk.c              |   66 ++
 rust/helpers/cpufreq.c          |   10 +
 rust/helpers/cpumask.c          |   23 +-
 rust/helpers/helpers.c          |    2 +
 rust/kernel/clk.rs              |  319 ++++++++
 rust/kernel/cpu.rs              |   31 +
 rust/kernel/cpufreq.rs          | 1320 +++++++++++++++++++++++++++++++
 rust/kernel/cpumask.rs          |  328 ++++++++
 rust/kernel/lib.rs              |    8 +
 rust/kernel/opp.rs              | 1151 +++++++++++++++++++++++++++
 rust/macros/module.rs           |   20 +-
 17 files changed, 3581 insertions(+), 57 deletions(-)
 create mode 100644 drivers/cpufreq/rcpufreq_dt.rs
 create mode 100644 rust/helpers/clk.c
 create mode 100644 rust/helpers/cpufreq.c
 create mode 100644 rust/kernel/clk.rs
 create mode 100644 rust/kernel/cpu.rs
 create mode 100644 rust/kernel/cpufreq.rs
 create mode 100644 rust/kernel/cpumask.rs
 create mode 100644 rust/kernel/opp.rs

-- 
2.31.1.272.g89b43f80a514


