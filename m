Return-Path: <linux-clk+bounces-22022-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8C5ABB5F7
	for <lists+linux-clk@lfdr.de>; Mon, 19 May 2025 09:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4A277AB85B
	for <lists+linux-clk@lfdr.de>; Mon, 19 May 2025 07:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C29926B97D;
	Mon, 19 May 2025 07:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JT0lb29K"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1906A26B95A
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 07:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747638525; cv=none; b=XnWZM1tREMP9SEQXvp0Vdx/vhB2vT0m6YdQWtIS+tVwLz6PnADO9GJ1ZEomVoDJqqXRd0bvl8p7gPJazHPDHBINUOYrZMw/i16Fekqz1I91+ADZOadwUAlcSj8fFYRCm2dJbuCakUYXg7zvxL8qbS0CZbh67S8znclpcrUN3isM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747638525; c=relaxed/simple;
	bh=bSGfihaGNpTLrew2plb74IvPF9i/L//OlHXrjuPBnlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bhl2pNhE/CqYoisbdArzHNM/4vbZHcxf1OAEhOi3awjqa59OPVxHUPmFcSe7Z8ZJ8EXkWfaF3HmDpVlMYfDGwtLidlP6GDOFpPrlPdYUnupIxGzqyLi7dieO/sS1Su1uvQLR6Lmh6FvS7WDcdEnh5oGaUDiF9S9IuDpAkHnkdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JT0lb29K; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30ea7f783a0so2159506a91.1
        for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747638523; x=1748243323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJD5XxP/UbgU2tTClsXxFPL2OFZZwS3SIz16j9nmHb0=;
        b=JT0lb29KTtR36Wba+Hnnqp6llM+gdcUwHgurfehZ0imFtZ71IurI6yofcVmF63vyKa
         rhMCLQ8eeMQ5vYYFOOL2Gf90qZrMSWgDv96PI3MKiEit/1R0byGDnx4Cj0lRSq6+OtIx
         j6rAeofnIUM6unG/7gsb45kULHTZ42VyARti0IguhNL5NJGJXa9kmNbts07BX0S/smb5
         /VlKej9JhAwqgNLWd7hjD0LTZ0Bsrn3K3Utk1lokrmaAQV76GG4bNclTpgWNOCAeo8sM
         tmP9pl2VfBP2smGCwS1+EJfixgB0UIqVfg6nR+s7/NCN0cp6HevzRnrFHPwCOA2IHvza
         /CVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747638523; x=1748243323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJD5XxP/UbgU2tTClsXxFPL2OFZZwS3SIz16j9nmHb0=;
        b=B8RmnRUbDjcXw6xiGKNFJoZTS/kBMp6eLcYrkjyedRPN1Gi+oTKkmgu92VdrtaH2Ee
         X9Ch3/Twop3cQUbrwZ/lZ6zSxA2tG1OislfzsMj9Ki36LiRQcilWECLtM0D3woOaUJRi
         0qU2ITbZLdKN9KyUYGktw6XwIn362iDz0yNxI6OjFv6I5gucgh+WSyK9aRvcnR3+SP++
         ZHBslVuKlM6Sww5tkKAdt9yebvOXWI0JGKhBM/eAQ88Ptu5/XnuPV0SXuCeYhUIIcMxl
         vAjCmobBFSx03NAcADCHAXu6lCcF5iT826iVPmHHyBNRtJ9ThxQ0f6C4diEoLSWDltJF
         e6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOsLmtW+lfTqmZ+rXeGbQumv5DfHWFj6L6Eu8HSt8TYH3nn5RDDszfyEJskPnmkswb+KRrZoUtZVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhDEWoNhk6L7tAooOxhL894bfRky5gWMQPl1b2rHCTbQLgWEEY
	ZewGfehnaRe3mIWYmT+duz0xRSc5qQpDdq4mzcanckCTDwMt0dZeXTZG2EMmF8whUzk=
X-Gm-Gg: ASbGncsX1s7DeEGWVgbo4P5uZyx9D9xyPwxKQOCNTLxtXVTYHoBkQxHrY0F3TkAbvwB
	XkHNRWsA1ekkbymSTx9G2g0nnuhDvc0qpUkvZ5uPzTq8Xg47yM1P/nbVg1qw4SYEL6VsTPQvDU8
	oZhQxH6SYPxMhGya6v1zLjkRks+a7G3+9DqPk+hndZtRq/13FrRjT22qXF5Xz+4xHsfuJcGSgIy
	DAJA4b5D3uqLichsinIKMcDUe7obE+VF6HnphOuuqFf30C03Y2tjvKSJiehTDVhZsXJedc+vAWI
	7gU0/5gNenq4gWCzUzlf40hqu+ewYt3mNsE6q7O3XOZ146ijr7wL
X-Google-Smtp-Source: AGHT+IFo7mmwVBQMKnS8Mxe6oQBwNYviN6LJSTibi/frTfT92J4pR6GkI4npO9nvxXO90t92Edat7Q==
X-Received: by 2002:a17:90b:4ccb:b0:2ff:5c4e:5acd with SMTP id 98e67ed59e1d1-30e7d5ca16emr19302001a91.35.1747638523205;
        Mon, 19 May 2025 00:08:43 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e6d90654asm6570718a91.34.2025.05.19.00.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 00:08:42 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
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
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>,
	linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH V12 15/15] cpufreq: Add Rust-based cpufreq-dt driver
Date: Mon, 19 May 2025 12:37:20 +0530
Message-Id: <23209b3d12c33fe5e13f5a80704bb3b319ebbd7c.1747634382.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1747634382.git.viresh.kumar@linaro.org>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a Rust-based implementation of the cpufreq-dt driver, covering
most of the functionality provided by the existing C version. Some
features, such as retrieving platform data from `cpufreq-dt-platdev.c`,
are still pending.

The driver has been tested with QEMU, and frequency scaling works as
expected.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/Kconfig        |  12 ++
 drivers/cpufreq/Makefile       |   1 +
 drivers/cpufreq/rcpufreq_dt.rs | 229 +++++++++++++++++++++++++++++++++
 3 files changed, 242 insertions(+)
 create mode 100644 drivers/cpufreq/rcpufreq_dt.rs

diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
index d64b07ec48e5..78702a08364f 100644
--- a/drivers/cpufreq/Kconfig
+++ b/drivers/cpufreq/Kconfig
@@ -217,6 +217,18 @@ config CPUFREQ_DT
 
 	  If in doubt, say N.
 
+config CPUFREQ_DT_RUST
+	tristate "Rust based Generic DT based cpufreq driver"
+	depends on HAVE_CLK && OF && RUST
+	select CPUFREQ_DT_PLATDEV
+	select PM_OPP
+	help
+	  This adds a Rust based generic DT based cpufreq driver for frequency
+	  management.  It supports both uniprocessor (UP) and symmetric
+	  multiprocessor (SMP) systems.
+
+	  If in doubt, say N.
+
 config CPUFREQ_VIRT
 	tristate "Virtual cpufreq driver"
 	depends on GENERIC_ARCH_TOPOLOGY
diff --git a/drivers/cpufreq/Makefile b/drivers/cpufreq/Makefile
index 22ab45209f9b..d38526b8e063 100644
--- a/drivers/cpufreq/Makefile
+++ b/drivers/cpufreq/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_CPU_FREQ_GOV_COMMON)		+= cpufreq_governor.o
 obj-$(CONFIG_CPU_FREQ_GOV_ATTR_SET)	+= cpufreq_governor_attr_set.o
 
 obj-$(CONFIG_CPUFREQ_DT)		+= cpufreq-dt.o
+obj-$(CONFIG_CPUFREQ_DT_RUST)		+= rcpufreq_dt.o
 obj-$(CONFIG_CPUFREQ_DT_PLATDEV)	+= cpufreq-dt-platdev.o
 obj-$(CONFIG_CPUFREQ_VIRT)		+= virtual-cpufreq.o
 
diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
new file mode 100644
index 000000000000..d0e60b7db81f
--- /dev/null
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust based implementation of the cpufreq-dt driver.
+
+use kernel::{
+    c_str,
+    clk::Clk,
+    cpu, cpufreq,
+    cpumask::CpumaskVar,
+    device::{Core, Device},
+    error::code::*,
+    fmt,
+    macros::vtable,
+    module_platform_driver, of, opp, platform,
+    prelude::*,
+    str::CString,
+    sync::Arc,
+};
+
+/// Finds exact supply name from the OF node.
+fn find_supply_name_exact(dev: &Device, name: &str) -> Option<CString> {
+    let prop_name = CString::try_from_fmt(fmt!("{}-supply", name)).ok()?;
+    dev.property_present(&prop_name)
+        .then(|| CString::try_from_fmt(fmt!("{name}")).ok())
+        .flatten()
+}
+
+/// Finds supply name for the CPU from DT.
+fn find_supply_names(dev: &Device, cpu: u32) -> Option<KVec<CString>> {
+    // Try "cpu0" for older DTs, fallback to "cpu".
+    let name = (cpu == 0)
+        .then(|| find_supply_name_exact(dev, "cpu0"))
+        .flatten()
+        .or_else(|| find_supply_name_exact(dev, "cpu"))?;
+
+    let mut list = KVec::with_capacity(1, GFP_KERNEL).ok()?;
+    list.push(name, GFP_KERNEL).ok()?;
+
+    Some(list)
+}
+
+/// Represents the cpufreq dt device.
+struct CPUFreqDTDevice {
+    opp_table: opp::Table,
+    freq_table: opp::FreqTable,
+    _mask: CpumaskVar,
+    _token: Option<opp::ConfigToken>,
+    _clk: Clk,
+}
+
+#[derive(Default)]
+struct CPUFreqDTDriver;
+
+#[vtable]
+impl opp::ConfigOps for CPUFreqDTDriver {}
+
+#[vtable]
+impl cpufreq::Driver for CPUFreqDTDriver {
+    const NAME: &'static CStr = c_str!("cpufreq-dt");
+    const FLAGS: u16 = cpufreq::flags::NEED_INITIAL_FREQ_CHECK | cpufreq::flags::IS_COOLING_DEV;
+    const BOOST_ENABLED: bool = true;
+
+    type PData = Arc<CPUFreqDTDevice>;
+
+    fn init(policy: &mut cpufreq::Policy) -> Result<Self::PData> {
+        let cpu = policy.cpu();
+        // SAFETY: The CPU device is only used during init; it won't get hot-unplugged. The cpufreq
+        // core  registers with CPU notifiers and the cpufreq core/driver won't use the CPU device,
+        // once the CPU is hot-unplugged.
+        let dev = unsafe { cpu::from_cpu(cpu)? };
+        let mut mask = CpumaskVar::new_zero(GFP_KERNEL)?;
+
+        mask.set(cpu);
+
+        let token = find_supply_names(dev, cpu)
+            .map(|names| {
+                opp::Config::<Self>::new()
+                    .set_regulator_names(names)?
+                    .set(dev)
+            })
+            .transpose()?;
+
+        // Get OPP-sharing information from "operating-points-v2" bindings.
+        let fallback = match opp::Table::of_sharing_cpus(dev, &mut mask) {
+            Ok(()) => false,
+            Err(e) if e == ENOENT => {
+                // "operating-points-v2" not supported. If the platform hasn't
+                // set sharing CPUs, fallback to all CPUs share the `Policy`
+                // for backward compatibility.
+                opp::Table::sharing_cpus(dev, &mut mask).is_err()
+            }
+            Err(e) => return Err(e),
+        };
+
+        // Initialize OPP tables for all policy cpus.
+        //
+        // For platforms not using "operating-points-v2" bindings, we do this
+        // before updating policy cpus. Otherwise, we will end up creating
+        // duplicate OPPs for the CPUs.
+        //
+        // OPPs might be populated at runtime, don't fail for error here unless
+        // it is -EPROBE_DEFER.
+        let mut opp_table = match opp::Table::from_of_cpumask(dev, &mut mask) {
+            Ok(table) => table,
+            Err(e) => {
+                if e == EPROBE_DEFER {
+                    return Err(e);
+                }
+
+                // The table is added dynamically ?
+                opp::Table::from_dev(dev)?
+            }
+        };
+
+        // The OPP table must be initialized, statically or dynamically, by this point.
+        opp_table.opp_count()?;
+
+        // Set sharing cpus for fallback scenario.
+        if fallback {
+            mask.setall();
+            opp_table.set_sharing_cpus(&mut mask)?;
+        }
+
+        let mut transition_latency = opp_table.max_transition_latency_ns() as u32;
+        if transition_latency == 0 {
+            transition_latency = cpufreq::ETERNAL_LATENCY_NS;
+        }
+
+        policy
+            .set_dvfs_possible_from_any_cpu(true)
+            .set_suspend_freq(opp_table.suspend_freq())
+            .set_transition_latency_ns(transition_latency);
+
+        let freq_table = opp_table.cpufreq_table()?;
+        // SAFETY: The `freq_table` is not dropped while it is getting used by the C code.
+        unsafe { policy.set_freq_table(&freq_table) };
+
+        // SAFETY: The returned `clk` is not dropped while it is getting used by the C code.
+        let clk = unsafe { policy.set_clk(dev, None)? };
+
+        mask.copy(policy.cpus());
+
+        Ok(Arc::new(
+            CPUFreqDTDevice {
+                opp_table,
+                freq_table,
+                _mask: mask,
+                _token: token,
+                _clk: clk,
+            },
+            GFP_KERNEL,
+        )?)
+    }
+
+    fn exit(_policy: &mut cpufreq::Policy, _data: Option<Self::PData>) -> Result<()> {
+        Ok(())
+    }
+
+    fn online(_policy: &mut cpufreq::Policy) -> Result<()> {
+        // We did light-weight tear down earlier, nothing to do here.
+        Ok(())
+    }
+
+    fn offline(_policy: &mut cpufreq::Policy) -> Result<()> {
+        // Preserve policy->data and don't free resources on light-weight
+        // tear down.
+        Ok(())
+    }
+
+    fn suspend(policy: &mut cpufreq::Policy) -> Result<()> {
+        policy.generic_suspend()
+    }
+
+    fn verify(data: &mut cpufreq::PolicyData) -> Result<()> {
+        data.generic_verify()
+    }
+
+    fn target_index(policy: &mut cpufreq::Policy, index: cpufreq::TableIndex) -> Result<()> {
+        let Some(data) = policy.data::<Self::PData>() else {
+            return Err(ENOENT);
+        };
+
+        let freq = data.freq_table.freq(index)?;
+        data.opp_table.set_rate(freq)
+    }
+
+    fn get(policy: &mut cpufreq::Policy) -> Result<u32> {
+        policy.generic_get()
+    }
+
+    fn set_boost(_policy: &mut cpufreq::Policy, _state: i32) -> Result<()> {
+        Ok(())
+    }
+
+    fn register_em(policy: &mut cpufreq::Policy) {
+        policy.register_em_opp()
+    }
+}
+
+kernel::of_device_table!(
+    OF_TABLE,
+    MODULE_OF_TABLE,
+    <CPUFreqDTDriver as platform::Driver>::IdInfo,
+    [(of::DeviceId::new(c_str!("operating-points-v2")), ())]
+);
+
+impl platform::Driver for CPUFreqDTDriver {
+    type IdInfo = ();
+    const OF_ID_TABLE: Option<of::IdTable<Self::IdInfo>> = Some(&OF_TABLE);
+
+    fn probe(
+        pdev: &platform::Device<Core>,
+        _id_info: Option<&Self::IdInfo>,
+    ) -> Result<Pin<KBox<Self>>> {
+        cpufreq::Registration::<CPUFreqDTDriver>::new_foreign_owned(pdev.as_ref())?;
+
+        let drvdata = KBox::new(Self {}, GFP_KERNEL)?;
+
+        Ok(drvdata.into())
+    }
+}
+
+module_platform_driver! {
+    type: CPUFreqDTDriver,
+    name: "cpufreq-dt",
+    author: "Viresh Kumar <viresh.kumar@linaro.org>",
+    description: "Generic CPUFreq DT driver",
+    license: "GPL v2",
+}
-- 
2.31.1.272.g89b43f80a514


